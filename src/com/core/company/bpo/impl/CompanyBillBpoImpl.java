package com.core.company.bpo.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.core.base.SearchBaseBpo;
import com.core.bill.model.BillProjectModel;
import com.core.company.bpo.CompanyBillBpo;
import com.core.company.model.CBillProjectModel;
import com.core.company.model.CBillTimeModel;
import com.core.company.model.CRegistResultModel;
import com.core.company.model.CompanyBillModel;
import com.ldw.frame.base.BaseException;
import com.ldw.frame.common.db.SQLExecutor;
import com.ldw.frame.common.exception.BusinessException;

@Component("com.core.company.bpo.impl.CompanyBillBpoImpl")
public class CompanyBillBpoImpl extends SearchBaseBpo implements CompanyBillBpo {

	public CompanyBillModel getAllRegistCompanyBillByDjlx(String djlx)
			throws BaseException {
		// 声明变量
		CompanyBillModel companyBillModel = new CompanyBillModel(); // 返回结果
		List<HashMap<String, Object>> cBillProjectResultList;// 计费标准列表
		// 查询所有有效的注册公司下的计费标准
		cBillProjectResultList = this.queryAllRegistCompanyBillByDjlx(djlx);
		if (cBillProjectResultList == null
				|| cBillProjectResultList.size() <= 0) {
			throw new BusinessException("不存在可提供代驾服务的代驾公司！");
		}
		// 转换结果为CompanyBillModel
		this.transResult(companyBillModel, cBillProjectResultList);
		// 返回
		return companyBillModel;
	}

	private List<HashMap<String, Object>> queryAllRegistCompanyBillByDjlx(
			String djlx) throws BaseException {
		List<HashMap<String, Object>> cBillProjectResultList;
		StringBuilder sb = new StringBuilder();
		SQLExecutor sql = this.getSession().getSQLExecutor();

		sb.append(" select c.gsmc,c.gsbh,                 ");
		sb.append("        r.zcid,r.gsid,r.djlx,r.zczt,r.jfbbid,r.yxq,r.yylxr,r.yylxdh, ");
		sb.append("        t.qssj,t.zzsj, t.jfsjdid,      ");
		sb.append("        p.jfxmid,p.jfbzz,p.jfed,p.jfxmbh,p.jftjdw,p.jftjxx,p.jftjsx,p.jfbzdw,p.jfbzjsff,p.sfbhxx,p.sfbhsx ");
		sb.append("   from c_info      c,              ");
		sb.append("        c_regist    r,              ");
		sb.append("        c_b_version v,              ");
		sb.append("        c_b_time    t,              ");
		sb.append("        c_b_project p               ");
		sb.append("  where c.gsid = r.gsid                ");
		sb.append("    and IFNULL(r.yxq, now()) >= now() ");
		sb.append("    and r.zczt = '01'                  ");
		sb.append("    and r.djlx = '01'                  ");
		sb.append("    and r.jfbbid = v.jfbbid            ");
		sb.append("    and r.jfbbid = t.jfbbid            ");
		sb.append("    and v.jfbbid = t.jfbbid            ");
		sb.append("    and r.jfbbid = p.jfbbid            ");
		sb.append("    and t.jfsjdid = p.jfsjdid          ");
		sb.append(" order by r.gsid,v.jfbbid,t.jfsjdid,p.jfxmid ");

		sql.setSQL(sb);
		cBillProjectResultList = sql.executeQuery();

		return cBillProjectResultList;
	}

	private void transResult(CompanyBillModel companyBillModel,
			List<HashMap<String, Object>> cBillProjectResultList)
			throws BaseException {
		// 声明
		List<CRegistResultModel> tempCRegistList = new ArrayList<CRegistResultModel>();
		HashMap<String, List<CBillTimeModel>> tempCBillTimeMap = new HashMap<String, List<CBillTimeModel>>();
		HashMap<String, List<BillProjectModel>> tempBillProjectMap = new HashMap<String, List<BillProjectModel>>();
		HashMap<String, List<CBillProjectModel>> tempCBillProjectMap = new HashMap<String, List<CBillProjectModel>>();

		HashMap<String, Object> tempMap;
		String zcid, jfbbid, jfsjdid, jfxmbh, cbproject,jfxmid;
		// key:zcid
		HashMap<String, CRegistResultModel> tempCRMap = new HashMap<String, CRegistResultModel>();
		CRegistResultModel cRegistModel;
		// key:jfsjdid,区分时间段是否已处理,前提是jfsjdid唯一
		HashMap<String, Object> tempTimeMap = new HashMap<String, Object>();
		CBillTimeModel cBillTimeModel;
		// key:jfsjdid+jfxmbh,区分不同时间段下的缴费项目信息
		HashMap<String, Object> tempProjectMap = new HashMap<String, Object>();
		BillProjectModel billProjectModel;
		CBillProjectModel cBillProjectModel;
		// 转换
		for (int i = 0, size = cBillProjectResultList.size(); i < size; i++) {
			tempMap = cBillProjectResultList.get(i);
			zcid = (String) tempMap.get("ZCID");
			jfbbid = (String) tempMap.get("JFBBID");
			jfsjdid = (String) tempMap.get("JFSJDID");
			jfxmbh = (String) tempMap.get("JFXMBH");
			jfxmid = (String) tempMap.get("JFXMID");

			cbproject = jfsjdid + jfxmbh;

			// 公司转换
			if (!tempCRMap.containsKey(zcid)) {
				cRegistModel = new CRegistResultModel();
				cRegistModel.setZcid(zcid);
				cRegistModel.setGsbh((String) tempMap.get("GSBH"));
				cRegistModel.setGsid((String) tempMap.get("GSID"));
				cRegistModel.setGsmc((String) tempMap.get("GSMC"));
				cRegistModel.setDjlx((String) tempMap.get("DJLX"));
				cRegistModel.setZczt((String) tempMap.get("ZCZT"));
				cRegistModel.setJfbbid(jfbbid);
				cRegistModel.setYxq((Date) tempMap.get("YXQ"));
				cRegistModel.setYylxdh((String) tempMap.get("YYLXDH"));
				cRegistModel.setYylxr((String) tempMap.get("YYLXR"));

				tempCRMap.put(zcid, cRegistModel);
				tempCRegistList.add(cRegistModel);
			}
			// 版本下时间段转换
			if (!tempTimeMap.containsKey(jfsjdid)) {
				cBillTimeModel = new CBillTimeModel();
				cBillTimeModel.setJfbbid(jfbbid);
				cBillTimeModel.setJfsjdid(jfsjdid);
				cBillTimeModel.setQssj((String) tempMap.get("QSSJ"));
				cBillTimeModel.setZzsj((String) tempMap.get("ZZSJ"));

				if (!tempCBillTimeMap.containsKey(jfbbid)) {
					tempCBillTimeMap.put(jfbbid,
							new ArrayList<CBillTimeModel>());
				}

				tempCBillTimeMap.get(jfbbid).add(cBillTimeModel);
				//
				tempTimeMap.put(jfsjdid, "");
			}

			// 时间段下计费项目
			if (!tempProjectMap.containsKey(cbproject)) {
				billProjectModel = new BillProjectModel();
				billProjectModel.setXmbh(jfxmbh);
				billProjectModel.setJfxmid(jfxmid);

				if (!tempBillProjectMap.containsKey(jfsjdid)) {
					tempBillProjectMap.put(jfsjdid,
							new ArrayList<BillProjectModel>());
				}
				tempBillProjectMap.get(jfsjdid).add(billProjectModel);

				tempProjectMap.put(cbproject, "");
			}

			// 时间段计费项目下的计费标准
			cBillProjectModel = new CBillProjectModel();
			cBillProjectModel.setJfbbid(jfbbid);
			cBillProjectModel.setJfsjdid(jfsjdid);
			cBillProjectModel.setJfxmbh(jfxmbh);
			cBillProjectModel.setJftjdw((String) tempMap.get("JFTJDW"));
			cBillProjectModel.setJftjxx((String) tempMap.get("JFTJXX"));
			cBillProjectModel.setJftjsx((String) tempMap.get("JFTJSX"));
			cBillProjectModel.setSfbhsx((String) tempMap.get("SFBHSX"));
			cBillProjectModel.setSfbhxx((String) tempMap.get("SFBHXX"));
			cBillProjectModel.setJfbzdw((String) tempMap.get("JFBZDW"));
			cBillProjectModel.setJfbzz((String) tempMap.get("JFBZZ"));
			cBillProjectModel.setJfbzjsff((String) tempMap.get("JFBZJSFF"));
			cBillProjectModel.setJfed((BigDecimal) tempMap.get("JFED"));

			if (!tempCBillProjectMap.containsKey(cbproject)) {
				tempCBillProjectMap.put(cbproject,
						new ArrayList<CBillProjectModel>());
			}
			tempCBillProjectMap.get(cbproject).add(cBillProjectModel);
		}
		// 设置结果
		companyBillModel.setcRegistResultList(tempCRegistList);
		companyBillModel.setcBillTimeMap(tempCBillTimeMap);
		companyBillModel.setBillProjectMap(tempBillProjectMap);
		companyBillModel.setcBillProjectMap(tempCBillProjectMap);
	}
}
