package com.core.search.bpo.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.core.base.CoreCodeNames;
import com.core.base.SearchBaseBpo;
import com.core.base.util.DsDateUtil;
import com.core.bill.model.BillProjectModel;
import com.core.company.model.CBillProjectModel;
import com.core.company.model.CBillTimeModel;
import com.core.company.model.CRegistResultModel;
import com.core.company.model.CompanyBillModel;
import com.core.search.bpo.SearchBpo;
import com.core.search.domain.SearchBatchDomain;
import com.core.search.domain.SearchRecordDomain;
import com.core.search.domain.SearchResDetailDomain;
import com.core.search.domain.SearchResultDomain;
import com.core.search.model.SearchBatchModel;
import com.core.search.model.SearchQueryModel;
import com.core.search.model.SearchRecordModel;
import com.core.search.model.SearchResDetailModel;
import com.core.search.model.SearchResultModel;
import com.core.user.model.UserForBusinessModel;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;
import com.ldw.frame.common.exception.BusinessException;
import com.ldw.frame.common.global.CodeNames;
import com.ldw.frame.common.util.SortUtil;

@Component("com.core.search.bpo.impl.SearchBpoImpl")
public class SearchBpoImpl extends SearchBaseBpo implements SearchBpo {

	@Override
	public SearchRecordModel CalcAndSavePersonDriveSearch(
			UserForBusinessModel userForBusinessModel,
			SearchQueryModel searchQueryModel, CompanyBillModel companyBillModel)
			throws BaseException {
		SearchRecordModel recordModel;
		String ssjlid;
		SearchBatchDomain batchDomain = new SearchBatchDomain();
		SearchRecordDomain recordDomain = new SearchRecordDomain();
		List<SearchResultDomain> resultDomainList = new ArrayList<SearchResultDomain>();
		List<SearchResDetailDomain> resDetailDomainList = new ArrayList<SearchResDetailDomain>();
		// 1.计算,并产生SearchBatchDomain、SearchRecordDomain、SearchResultDomain、SearchResDetailDomain
		// 1.1 设置搜索批次domain
		batchDomain.setSspcid(searchQueryModel.getSspcid());
		batchDomain.setUserid(userForBusinessModel.getUserId());
		batchDomain.setYysj(searchQueryModel.getYysj());
		batchDomain.setDdsj(searchQueryModel.getDdsj());
		batchDomain.setCfdmc(searchQueryModel.getCfdmc());
		batchDomain.setCfdjd(searchQueryModel.getCfdjd());
		batchDomain.setCfdwd(searchQueryModel.getCfdwd());
		batchDomain.setMddjd(searchQueryModel.getMddjd());
		batchDomain.setMddmc(searchQueryModel.getMddmc());
		batchDomain.setMddwd(searchQueryModel.getMddwd());
		batchDomain.setYghs(searchQueryModel.getYghs());
		batchDomain.setYgjl(searchQueryModel.getYgjl());
		// 1.2设置搜索记录domain
		recordDomain.setYysj(searchQueryModel.getYysj());
		recordDomain.setDdsj(searchQueryModel.getDdsj());
		recordDomain.setMddmc(searchQueryModel.getMddmc());
		recordDomain.setMddjd(searchQueryModel.getMddjd());
		recordDomain.setMddwd(searchQueryModel.getMddwd());
		recordDomain.setYghs(searchQueryModel.getYghs());
		recordDomain.setYgjl(searchQueryModel.getYgjl());
		// 1.3计算费用并将结果保存在搜索结果domain以及搜索结果明细domain中
		this.calcPersonDriveSearch(searchQueryModel, companyBillModel,
				resultDomainList, resDetailDomainList);
		// 2.保存，并返回搜索记录ID
		if (resultDomainList == null || resultDomainList.size() <= 0) {
			throw new BusinessException("没有满足条件的搜索记录信息");
		}
		if (resDetailDomainList == null || resDetailDomainList.size() <= 0) {
			throw new BusinessException("没有满足条件的搜索结果信息");
		}
		ssjlid = this.savePersonDriveSearch(batchDomain, recordDomain,
				resultDomainList, resDetailDomainList);
		// 3.返回结果
		recordModel = this.querySearchRecordModelByssjiId(ssjlid);
		return recordModel;
	}

	/**
	 * @Description: 计算代驾并返回搜索信息，便于后续批量保存
	 * @param userForBusinessModel
	 * @param searchQueryModel
	 * @param companyBillModel
	 * @param batchDomain
	 * @param recordDomain
	 * @param resultDomainList
	 * @param resDetailDomainList
	 * @throws BaseException
	 * @return void
	 * @author ldw
	 * @date 2015年4月12日 下午4:51:33
	 */
	private void calcPersonDriveSearch(SearchQueryModel searchQueryModel,
			CompanyBillModel companyBillModel,
			List<SearchResultDomain> resultDomainList,
			List<SearchResDetailDomain> resDetailDomainList)
			throws BaseException {
		String jfbbid;
		String jfsjdid;
		List<CBillTimeModel> cBillTimeModels;
		List<BillProjectModel> billProjectModels;
		String tempTimeQssj, tempTimeZzsj;
		String yysjStr;
		// 1.获取计费基础信息
		// 1.1 公司注册信息（含有版本号）
		List<CRegistResultModel> cRegistResultList = companyBillModel
				.getcRegistResultList();
		// 1.2 指定计费版本下计费时间段信息，key为jfbbid
		HashMap<String, List<CBillTimeModel>> cBillTimeMap = companyBillModel
				.getcBillTimeMap();
		// 1.3 指定计费时间段下的计费项目信息，key为jfsjdid（前提是缴费时间段为唯一，隐含jfbbid等）
		HashMap<String, List<BillProjectModel>> billProjectMap = companyBillModel
				.getBillProjectMap();
		// 1.4 指定计费时间段下计费项目对应的标准， key为 jfsjdid+jfxmbh
		HashMap<String, List<CBillProjectModel>> cBillProjectMap = companyBillModel
				.getcBillProjectMap();
		// 2.校验信息项
		if (cRegistResultList == null || cRegistResultList.size() <= 0) {
			throw new BusinessException("没有可以估算费用的公司");
		}
		if (cBillTimeMap == null) {
			throw new BusinessException("计费时间段信息为空");
		}
		if (billProjectMap == null) {
			throw new BusinessException("计费项目信息为空");
		}
		if (cBillProjectMap == null) {
			throw new BusinessException("代驾公司计费项目信息为空");
		}
		// 3.循环公司，逐个公司计算估算费用
		for (CRegistResultModel registResultModel : cRegistResultList) {
			try { // 之所以增加异常捕获，是因为一个公司配置出现问题，不能影响其他公司估算
					// 3.1 获取计费版本ID
				jfbbid = registResultModel.getJfbbid();
				if (jfbbid == null || "".equals(jfbbid)) {
					continue;
				}
				if (!cBillTimeMap.containsKey(jfbbid)) {
					continue;
				}
				// 3.2获取当前公司当前版本下计费时间段信息
				cBillTimeModels = cBillTimeMap.get(jfbbid);
				if (cBillTimeModels == null || cBillTimeModels.size() <= 0) {
					continue;
				}
				// 3.2.1根据搜索条件循环获取jfsjdid
				jfsjdid = ""; // 初始化计费时间段ID
				for (CBillTimeModel cBillTimeModel : cBillTimeModels) {
					tempTimeQssj = cBillTimeModel.getQssj();
					tempTimeZzsj = cBillTimeModel.getZzsj();
					yysjStr = searchQueryModel.getYysjStr();
					if (DsDateUtil.betweenTime(yysjStr, tempTimeQssj,
							tempTimeZzsj)) {
						jfsjdid = cBillTimeModel.getJfsjdid();
					}
				}
				if (jfsjdid == null || "".equals(jfsjdid)) {
					continue;
				}
				// 3.3获取计费时间段下的所有计费项目
				if (!billProjectMap.containsKey(jfsjdid)) {
					continue;
				}
				billProjectModels = billProjectMap.get(jfsjdid);
				if (billProjectModels == null || billProjectModels.size() <= 0) {
					continue;
				}
				// 3.4针对每一个计费项目进行估算费用
				this.calcOneCompany(searchQueryModel, registResultModel,
						jfsjdid, billProjectModels, cBillProjectMap,
						resultDomainList, resDetailDomainList);
			} catch (Exception e) {
				e.printStackTrace(); // 建议：后续采用记录错误日志表的方式，方便发现配置有问题的公司
				continue;
			}
		}
		// 4.对所有公司估算价格进行排名，并将排名更新到resultDomainList
		if (resultDomainList == null || resultDomainList.size() <= 0) {
			throw new BusinessException("估算搜索结果信息为空");
		}
		SortUtil.sortList(resultDomainList, "gsjg", 1);
		for (int i = 0, size = resultDomainList.size(); i < size; i++) {
			resultDomainList.get(i).setSspm(i + 1);
		}
	}

	private void calcOneCompany(SearchQueryModel searchQueryModel,
			CRegistResultModel registResultModel, String jfsjdid,
			List<BillProjectModel> billProjectModels,
			HashMap<String, List<CBillProjectModel>> cBillProjectMap,
			List<SearchResultDomain> resultDomainList,
			List<SearchResDetailDomain> resDetailDomainList)
			throws BaseException {
		String jfxmid, jfxmbh;
		List<CBillProjectModel> cBillProjectModels;
		Double gsjg = 0D;
		SearchResultDomain searchResultDomain;
		SearchResDetailDomain searchResDetailDomain;
		String gsid = registResultModel.getGsid();
		String jfbbid = registResultModel.getJfbbid();
		// 循环计费项目，逐个计算费用
		for (BillProjectModel billProjectModel : billProjectModels) {
			jfxmid = billProjectModel.getJfxmid();
			jfxmbh = billProjectModel.getXmbh();
			if (!cBillProjectMap.containsKey(jfsjdid + jfxmbh)) {
				continue;
			}
			cBillProjectModels = cBillProjectMap.get(jfsjdid + jfxmbh);
			if (cBillProjectModels == null || cBillProjectModels.size() <= 0) {
				continue;
			}
			if (CoreCodeNames.PersonBillProject.qbjgs.equals(jfxmbh)) {
				// 起步价（以开始时间为准）
				searchResDetailDomain = this.calcForQbjgs(cBillProjectModels);
			} else if (CoreCodeNames.PersonBillProject.qbjge.equals(jfxmbh)) {
				// 起步价（以结束时间为准）
				searchResDetailDomain = this.calcForQbjge(
						searchQueryModel.getDdsj(), cBillProjectModels);
			} else if (CoreCodeNames.PersonBillProject.hsjf.equals(jfxmbh)) {
				// 耗时计费
				searchResDetailDomain = this.calcForYghs(
						searchQueryModel.getYghs(), cBillProjectModels);
			} else if (CoreCodeNames.PersonBillProject.lcjf.equals(jfxmbh)) {
				// 里程计费
				searchResDetailDomain = this.calcForYgjl(
						searchQueryModel.getYgjl(), cBillProjectModels);
			} else if (CoreCodeNames.PersonBillProject.dlwz.equals(jfxmbh)) {
				// 地理位置计费
				searchResDetailDomain = this.calcForDlwz(searchQueryModel,
						cBillProjectModels);
			} else {
				continue;
			}
			if (searchResDetailDomain == null) {
				continue;
			}
			// 计算估算价格，为搜索结果提供估算总价格
			gsjg = gsjg + searchResDetailDomain.getXmfy();
			// 更新resDetailDomainList
			searchResDetailDomain.setGsid(gsid);
			searchResDetailDomain.setJfbbid(jfbbid);
			searchResDetailDomain.setJfxmid(jfxmid);

			resDetailDomainList.add(searchResDetailDomain);
		}
		// 更新搜索结果项
		searchResultDomain = new SearchResultDomain();
		searchResultDomain.setGsid(gsid);
		searchResultDomain.setGsjg(gsjg);
		searchResultDomain.setJfbbid(jfbbid);

		resultDomainList.add(searchResultDomain);
	}

	/**
	 * @Description: 计算起步价（以起始时间为准）
	 * @param cBillProjectModels
	 * @return
	 * @throws BaseException
	 * @return SearchResDetailDomain
	 * @author ldw
	 * @date 2015年4月13日 下午3:52:19
	 */
	private SearchResDetailDomain calcForQbjgs(
			List<CBillProjectModel> cBillProjectModels) throws BaseException {
		SearchResDetailDomain searchResDetailDomain = new SearchResDetailDomain();
		CBillProjectModel cBillProjectModel = cBillProjectModels.get(0); // 只可能有一条
		Double xmfy = cBillProjectModel.getJfed();
		if (xmfy == null || xmfy == 0D) {
			return null;
		}
		searchResDetailDomain.setXmfy(xmfy);
		searchResDetailDomain.setXmfyms("");
		return searchResDetailDomain;
	}

	/**
	 * @Description: 计算起步价（以到达时间为准）
	 * @param ddsj
	 * @param cBillProjectModels
	 * @return
	 * @throws BaseException
	 * @return SearchResDetailDomain
	 * @author ldw
	 * @date 2015年4月13日 下午3:52:39
	 */
	private SearchResDetailDomain calcForQbjge(Date ddsj,
			List<CBillProjectModel> cBillProjectModels) throws BaseException {
		SearchResDetailDomain searchResDetailDomain = new SearchResDetailDomain();
		String qqsj, zzsj;
		Double xmfy = 0D;
		for (CBillProjectModel cBillProjectModel : cBillProjectModels) {
			qqsj = cBillProjectModel.getJftjxx();
			zzsj = cBillProjectModel.getJftjsx();
			if (ddsj.compareTo(DsDateUtil.setTime(ddsj, qqsj)) >= 0
					&& ddsj.compareTo(DsDateUtil.setTime(ddsj, zzsj)) <= 0) {
				xmfy = cBillProjectModel.getJfed();
			}
		}
		if (xmfy == null || xmfy == 0D) {
			return null;
		}
		searchResDetailDomain.setXmfy(xmfy);
		searchResDetailDomain.setXmfyms("");
		return searchResDetailDomain;
	}

	/**
	 * @Description: 计算耗时费用
	 * @param yghs
	 * @param cBillProjectModels
	 * @return
	 * @throws BaseException
	 * @return SearchResDetailDomain
	 * @author ldw
	 * @date 2015年4月13日 下午3:52:54
	 */
	private SearchResDetailDomain calcForYghs(Integer yghs,
			List<CBillProjectModel> cBillProjectModels) throws BaseException {
		SearchResDetailDomain searchResDetailDomain = new SearchResDetailDomain();
		Integer maxHs;
		String jftjxx, jftjsx;
		String jfbzStr;
		Integer jfxxVal, jfsxVal;
		Integer jfbzVal;
		Double jfed;
		String jfjsff;
		Double xmfy = 0D;
		String xmfyms = "";
		String tempMs;
		for (CBillProjectModel cBillProjectModel : cBillProjectModels) {
			jftjxx = cBillProjectModel.getJftjxx();
			jftjsx = cBillProjectModel.getJftjsx();
			jfbzStr = cBillProjectModel.getJfbzz();
			jfed = cBillProjectModel.getJfed();
			jfjsff = cBillProjectModel.getJfbzjsff();

			jfbzVal = Integer.valueOf(jfbzStr);
			jfxxVal = Integer.valueOf(jftjxx);
			if (jftjsx == null || "".equals(jftjsx)) {
				jfsxVal = yghs;
			} else {
				jfsxVal = Integer.valueOf(jftjsx);
			}
			if (yghs > jfsxVal) {
				maxHs = jfsxVal;
			} else {
				maxHs = yghs;
			}
			if (yghs <= jfxxVal) { // 耗时不包含最低计费时间
				continue;
			}

			xmfy = xmfy
					+ (jfed * this.getMath(Double.valueOf(maxHs - jfxxVal),
							Double.valueOf(jfbzVal), jfjsff));
			tempMs = "(" + maxHs + " - " + jfxxVal + ") * " + jfed + "元/"
					+ jfbzVal + "分钟";
			if (xmfyms == null || "".equals(xmfyms)) {
				xmfyms = tempMs;
			} else {
				xmfyms = xmfyms + " + " + tempMs;
			}
		}

		if (xmfy == null || xmfy == 0D) {
			return null;
		}
		searchResDetailDomain.setXmfy(xmfy);
		searchResDetailDomain.setXmfyms(xmfyms);

		return searchResDetailDomain;
	}

	/**
	 * @Description: 计算里程费用
	 * @param ygjl
	 * @param cBillProjectModels
	 * @return
	 * @throws BaseException
	 * @return SearchResDetailDomain
	 * @author ldw
	 * @date 2015年4月13日 下午3:55:30
	 */
	private SearchResDetailDomain calcForYgjl(Double ygjl,
			List<CBillProjectModel> cBillProjectModels) throws BaseException {
		SearchResDetailDomain searchResDetailDomain = new SearchResDetailDomain();
		Double maxJl;
		String jftjxx, jftjsx;
		String jfbzStr;
		Double jfxxVal, jfsxVal;
		Double jfbzVal;
		Double jfed;
		String jfjsff;
		Double xmfy = 0D;
		String xmfyms = "";
		String tempMs;
		for (CBillProjectModel cBillProjectModel : cBillProjectModels) {
			jftjxx = cBillProjectModel.getJftjxx();
			jftjsx = cBillProjectModel.getJftjsx();
			jfbzStr = cBillProjectModel.getJfbzz();
			jfed = cBillProjectModel.getJfed();
			jfjsff = cBillProjectModel.getJfbzjsff();

			jfbzVal = Double.valueOf(jfbzStr);
			jfxxVal = Double.valueOf(jftjxx);
			if (jftjsx == null || "".equals(jftjsx)) {
				jfsxVal = ygjl;
			} else {
				jfsxVal = Double.valueOf(jftjsx);
			}
			if (ygjl > jfsxVal) {
				maxJl = jfsxVal;
			} else {
				maxJl = ygjl;
			}
			if (ygjl <= jfxxVal) { // 耗时不包含最低计费时间
				continue;
			}

			xmfy = xmfy
					+ (jfed * this.getMath(maxJl - jfxxVal, jfbzVal, jfjsff));
			tempMs = "(" + maxJl + " - " + jfxxVal + ") * " + jfed + "元/"
					+ jfbzVal + "公里";
			if (xmfyms == null || "".equals(xmfyms)) {
				xmfyms = tempMs;
			} else {
				xmfyms = xmfyms + " + " + tempMs;
			}
		}
		if (xmfy == null || xmfy == 0D) {
			return null;
		}
		searchResDetailDomain.setXmfy(xmfy);
		searchResDetailDomain.setXmfyms(xmfyms);

		return searchResDetailDomain;
	}

	/**
	 * @Description: 计算地理位置费用
	 * @param searchQueryModel
	 * @param cBillProjectModels
	 * @return
	 * @throws BaseException
	 * @return SearchResDetailDomain
	 * @author ldw
	 * @date 2015年4月13日 下午6:00:51
	 */
	private SearchResDetailDomain calcForDlwz(
			SearchQueryModel searchQueryModel,
			List<CBillProjectModel> cBillProjectModels) throws BaseException {
		Double cfdjd = Double.valueOf(searchQueryModel.getCfdjd());// 出发地经度
		Double cfdwd = Double.valueOf(searchQueryModel.getCfdwd());// 出发地纬度
		Double mddjd = Double.valueOf(searchQueryModel.getMddjd());// 目的地经度
		Double mddwd = Double.valueOf(searchQueryModel.getMddwd());// 目的地纬度
		SearchResDetailDomain searchResDetailDomain = new SearchResDetailDomain();
		Double xmfy = 0D;
		String xmfyms = "";
		String jftjxx, jftjsx;
		Double eastLngxx, eastLngsx;
		Double westLngxx, westLngsx;
		Double northLatxx, northLatsx;
		Double southLatxx, southLatsx;
		String[] dlwzArr;
		Double jfed;

		for (CBillProjectModel cBillProjectModel : cBillProjectModels) {
			jftjxx = cBillProjectModel.getJftjxx();
			jftjsx = cBillProjectModel.getJftjsx();
			jfed = cBillProjectModel.getJfed();

			if (jftjxx == null || "".equals(jftjxx)) {
				xmfy = xmfy + jfed;
				xmfyms = xmfyms + "";
				continue;
			} else {
				dlwzArr = jftjxx.split(":");// 东、南、西、北
				eastLngxx = Double.valueOf(dlwzArr[0]);
				southLatxx = Double.valueOf(dlwzArr[1]);
				westLngxx = Double.valueOf(dlwzArr[2]);
				northLatxx = Double.valueOf(dlwzArr[3]);
			}
			if (jftjsx != null && !"".equals(jftjsx)) {
				dlwzArr = jftjxx.split(":");// 东、南、西、北
				eastLngsx = Double.valueOf(dlwzArr[0]);
				southLatsx = Double.valueOf(dlwzArr[1]);
				westLngsx = Double.valueOf(dlwzArr[2]);
				northLatsx = Double.valueOf(dlwzArr[3]);
			} else {
				eastLngsx = 999999D;
				southLatsx = 0D;
				westLngsx = 0D;
				northLatsx = 999999D;
			}
			// 判断目的地-地理位置
			if ((mddjd > eastLngxx && mddjd <= eastLngsx)
					|| (mddjd < westLngxx && mddjd >= westLngsx)
					|| (mddwd > northLatxx && mddwd <= northLatsx)
					|| (mddwd < southLatxx && mddwd >= southLatsx)) {
				xmfy = xmfy + jfed;
				xmfyms = xmfyms + "";
			}
			// 判断出发地-地理位置
			if ((cfdjd > eastLngxx && cfdjd <= eastLngsx)
					|| (cfdjd < westLngxx && cfdjd >= westLngsx)
					|| (cfdwd > northLatxx && cfdwd <= northLatsx)
					|| (cfdwd < southLatxx && cfdwd >= southLatsx)) {
				xmfy = xmfy + jfed;
				xmfyms = xmfyms + "";
			}
		}
		if (xmfy == null || xmfy == 0D) {
			return null;
		}
		searchResDetailDomain.setXmfy(xmfy);
		searchResDetailDomain.setXmfyms(xmfyms);
		return searchResDetailDomain;
	}

	/**
	 * @Description: 根据计数方式，获取除法结果
	 * @param numerator
	 *            分子
	 * @param denominator
	 *            分母
	 * @param jsff
	 *            计数方式
	 * @return
	 * @throws BaseException
	 * @return Integer
	 * @author ldw
	 * @date 2015年4月13日 下午7:07:47
	 */
	private Double getMath(Double numerator, Double denominator, String jsff)
			throws BaseException {
		Double result;
		if (CoreCodeNames.Jfbzjsfs.sqz.equals(jsff)) {
			result = Math.ceil(numerator / denominator);
		} else if (CoreCodeNames.Jfbzjsfs.sswr.equals(jsff)) {
			result = Double.valueOf(Math.round(numerator / denominator));
		} else if (CoreCodeNames.Jfbzjsfs.xqz.equals(jsff)) {
			result = Math.floor(numerator / denominator);
		} else {// 默认上取整
			result = Math.ceil(numerator / denominator);
		}
		return result;
	}

	/**
	 * @Description: 保存搜索信息并返回搜索记录ID
	 * @param batchDomain
	 * @param recordDomain
	 * @param resultDomainList
	 * @param resDetailDomainList
	 * @return
	 * @throws BaseException
	 * @return String 搜索记录ID
	 * @author ldw
	 * @date 2015年4月12日 下午4:50:48
	 */
	private String savePersonDriveSearch(SearchBatchDomain batchDomain,
			SearchRecordDomain recordDomain,
			List<SearchResultDomain> resultDomainList,
			List<SearchResDetailDomain> resDetailDomainList)
			throws BaseException {
		String sspcid = batchDomain.getSspcid();
		String ssjlid;
		if (sspcid == null || "".equals(sspcid)) {
			// 1.保存批次信息（如果批次ID已存在，那么不再保存）
			sspcid = this.addSearchBatch(batchDomain);
		}
		// 2.保存搜索记录信息
		// 2.1更新sspcid
		recordDomain.setSspcid(sspcid);
		// 2.2保存并返回搜索记录ID
		ssjlid = this.addSearchRecord(recordDomain);
		// 3.批量保存搜索结果信息
		// 3.1更新sspcid与ssjlid
		for (SearchResultDomain searchResultDomain : resultDomainList) {
			searchResultDomain.setSspcid(sspcid);
			searchResultDomain.setSsjlid(ssjlid);
		}
		// 3.2保存搜索结果信息
		this.addBatchSearchResult(resultDomainList);
		// 4.批量保存搜索结果明细信息
		// 4.1更新ssjlid
		for (SearchResDetailDomain searchResDetailDomain : resDetailDomainList) {
			searchResDetailDomain.setSsjlid(ssjlid);
		}
		// 4.2保存搜索结果明细信息
		this.addBatchSearchResDetail(resDetailDomainList);
		return ssjlid;
	}

	/**
	 * @Description: 增加搜索批次信息，返回搜索批次ID
	 * @param batchDomain
	 * @return
	 * @throws BaseException
	 * @return String
	 * @author ldw
	 * @date 2015年4月14日 下午1:56:21
	 */
	private String addSearchBatch(SearchBatchDomain batchDomain)
			throws BaseException {
		String sspcid = dBUtil.generateSysId("SEQ_DS", "SB");
		batchDomain.setSspcid(sspcid);

		SQLExecutor sql = this.getSession().getSQLExecutor();
		StringBuilder sb = new StringBuilder();
		String dbType = globalName.getDbType();

		sb.append(" insert into search_batch(sspcid,userid,sssj,yysj,cfdmc,cfdjd,cfdwd,");
		sb.append("                             mddmc,mddjd,mddwd,yghs,ygjl,ddsj,bz)      ");
		if (CodeNames.DBType.oracle.equals(dbType)) {
			sb.append(" values(:sspcid,:userid,sysdate,:yysj,:cfdmc,:cfdjd,:cfdwd,");
			sb.append("          :mddmc,:mddjd,:mddwd,:yghs,:ygjl,:ddsj,:bz) ");
		} else if (CodeNames.DBType.mysql.equals(dbType)) {
			sb.append(" values(:sspcid,:userid,now(),:yysj,:cfdmc,:cfdjd,:cfdwd,");
			sb.append("          :mddmc,:mddjd,:mddwd,:yghs,:ygjl,:ddsj,:bz) ");
		} else { // 到时候再说。。。

		}

		sql.setSQL(sb);
		sql.setBeans(batchDomain);
		sql.executeUpdate();

		return sspcid;
	}

	/**
	 * @Description: 增加搜索记录信息，返回搜索记录ID
	 * @param recordDomain
	 * @return
	 * @throws BaseException
	 * @return String
	 * @author ldw
	 * @date 2015年4月14日 下午1:56:39
	 */
	private String addSearchRecord(SearchRecordDomain recordDomain)
			throws BaseException {
		String ssjlid = dBUtil.generateSysId("SEQ_DS", "SR");
		recordDomain.setSsjlid(ssjlid);

		SQLExecutor sql = this.getSession().getSQLExecutor();
		StringBuilder sb = new StringBuilder();
		String dbType = globalName.getDbType();

		sb.append(" insert into search_record(ssjlid,sspcid,sssj,yysj,mddmc,mddjd,mddwd");
		sb.append("                             ,yghs,ygjl,ddsj,bz)      ");
		if (CodeNames.DBType.oracle.equals(dbType)) {
			sb.append(" values(:ssjlid,:sspcid,sysdate,:yysj,:mddmc,:mddjd,:mddwd,");
			sb.append("          :yghs,:ygjl,:ddsj,:bz) ");
		} else if (CodeNames.DBType.mysql.equals(dbType)) {
			sb.append(" values(:ssjlid,:sspcid,now(),:yysj,:mddmc,:mddjd,:mddwd,");
			sb.append("          :yghs,:ygjl,:ddsj,:bz) ");
		} else { // 到时候再说。。。

		}

		sql.setSQL(sb);
		sql.setBeans(recordDomain);
		sql.executeUpdate();

		return ssjlid;
	}

	/**
	 * @Description: 批量增加搜索结果信息
	 * @param resultDomainList
	 * @throws BaseException
	 * @return void
	 * @author ldw
	 * @date 2015年4月14日 下午1:56:55
	 */
	private void addBatchSearchResult(List<SearchResultDomain> resultDomainList)
			throws BaseException {
		SQLExecutor sql = this.getSession().getSQLExecutor();
		StringBuilder sb = new StringBuilder();

		sb.append(" insert into search_result(ssjlid,gsid,sspcid,gsjg,sspm,jfbbid,bz) ");
		sb.append(" values(:ssjlid,:gsid,:sspcid,:gsjg,:sspm,:jfbbid,:bz)           ");
		sql.setSQL(sb);
		for (SearchResultDomain searchResultDomain : resultDomainList) {
			sql.setBeans(searchResultDomain);
			sql.addBatch();
		}

		sql.executeBatch();
	}

	/**
	 * @Description: 批量增加搜索结果明细信息
	 * @param resDetailDomainList
	 * @throws BaseException
	 * @return void
	 * @author ldw
	 * @date 2015年4月14日 下午1:57:05
	 */
	private void addBatchSearchResDetail(
			List<SearchResDetailDomain> resDetailDomainList)
			throws BaseException {
		SQLExecutor sql = this.getSession().getSQLExecutor();
		StringBuilder sb = new StringBuilder();

		sb.append(" insert into search_res_detail(ssjlid,gsid,jfxmid,jfbbid,xmfy,xmfyms,bz) ");
		sb.append(" values(:ssjlid,:gsid,:jfxmid,:jfbbid,:xmfy,:xmfyms,:bz)          ");
		sql.setSQL(sb);
		for (SearchResDetailDomain searchResDetailDomain : resDetailDomainList) {
			sql.setBeans(searchResDetailDomain);
			sql.addBatch();
		}

		sql.executeBatch();
	}

	@Override
	public SearchRecordModel querySearchRecordModelByssjiId(String ssjlId)
			throws BaseException {
		SearchRecordModel searchRecordModel;
		StringBuilder sb = new StringBuilder();
		SQLExecutor sql = this.getSession().getSQLExecutor();
		sb.append(" select * from search_record t where t.ssjlid = :ssjlid ");
		sql.setSQL(sb);
		sql.setString("ssjlid", ssjlId);

		searchRecordModel = sql.executeQueryBean(SearchRecordModel.class);

		return searchRecordModel;
	}

	@Override
	public SearchBatchModel querySearchBatchModelBysspcId(String sspcId)
			throws BaseException {
		SearchBatchModel searchBatchModel;
		StringBuilder sb = new StringBuilder();
		SQLExecutor sql = this.getSession().getSQLExecutor();
		sb.append(" select * from search_batch b where b.sspcid = :sspcid ");
		sql.setSQL(sb);
		sql.setString("sspcid", sspcId);

		searchBatchModel = sql.executeQueryBean(SearchBatchModel.class);

		return searchBatchModel;
	}

	@Override
	public List<SearchResultModel> querySearchResultModels(String ssjlId)
			throws BaseException {
		List<SearchResultModel> searchResultModels;
		StringBuilder sb = new StringBuilder();
		SQLExecutor sql = this.getSession().getSQLExecutor();
		sb.append(" select r.ssjlid,r.gsid,r.sspcid,r.gsjg,r.sspm,r.jfbbid,r.bz,c.yylxr,c.yylxdh yydh,i.gsmc ");
		sb.append("   from search_result r,c_regist c,c_info i ");
		sb.append("  where r.ssjlid = :ssjlid ");
		sb.append("         and r.gsid = c.gsid ");
		sb.append("         and  r.gsid = i.gsid ");
		sb.append("    order by r.sspm ");
		sql.setSQL(sb);
		sql.setString("ssjlid", ssjlId);
		searchResultModels = sql.executeQueryBeanList(SearchResultModel.class);
		return searchResultModels;
	}

	@Override
	public List<SearchResDetailModel> querySearchResDetailModels(String ssjlId,
			String gsid) throws BaseException {
		List<SearchResDetailModel> searchResDetailModels;
		StringBuilder sb = new StringBuilder();
		SQLExecutor sql = this.getSession().getSQLExecutor();
		sb.append(" select  d.*,p.xmmc                          ");
		sb.append(" from search_res_detail d,b_project p  ");
		sb.append(" where d.ssjlid = :ssjlid                    ");
		sb.append("     and d.gsid = :gsid                      ");
		sb.append("     and d.jfxmid = p.jfxmid                 ");
		sb.append("  order by d.jfxmid                          ");
		sql.setSQL(sb);
		sql.setString("ssjlid", ssjlId);
		sql.setString("gsid", gsid);
		searchResDetailModels = sql
				.executeQueryBeanList(SearchResDetailModel.class);
		return searchResDetailModels;
	}

}
