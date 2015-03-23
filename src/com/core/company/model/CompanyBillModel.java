package com.core.company.model;

import java.util.HashMap;
import java.util.List;

import com.core.bill.model.BillProjectModel;

/**
 * @Description: 代驾公司计费标准信息。为搜索估算费用提供费用标准数据
 * @author ldw
 * @date 2015年3月21日 下午10:51:12
 */
public class CompanyBillModel {
	// 有效的公司信息（签约期内的代驾公司）
	private List<CRegistResultModel> cRegistResultList;
	// 计费版本下的各时间段计费方案，key：jfbbid
	private HashMap<String, List<CBillTimeModel>> cBillTimeMap;
	// 计费时间段下计费项目信息，key：jfsjdid
	private HashMap<String, List<BillProjectModel>> billProjectMap;
	// 计费时间段下计费项目标准，key：jfsjdid+jfxmbh。
	private HashMap<String, List<CBillProjectModel>> cBillProjectMap;

	public List<CRegistResultModel> getcRegistResultList() {
		return cRegistResultList;
	}

	public void setcRegistResultList(List<CRegistResultModel> cRegistResultList) {
		this.cRegistResultList = cRegistResultList;
	}


	public HashMap<String, List<CBillTimeModel>> getcBillTimeMap() {
		return cBillTimeMap;
	}

	public void setcBillTimeMap(HashMap<String, List<CBillTimeModel>> cBillTimeMap) {
		this.cBillTimeMap = cBillTimeMap;
	}

	public HashMap<String, List<BillProjectModel>> getBillProjectMap() {
		return billProjectMap;
	}

	public void setBillProjectMap(
			HashMap<String, List<BillProjectModel>> billProjectMap) {
		this.billProjectMap = billProjectMap;
	}

	public HashMap<String, List<CBillProjectModel>> getcBillProjectMap() {
		return cBillProjectMap;
	}

	public void setcBillProjectMap(
			HashMap<String, List<CBillProjectModel>> cBillProjectMap) {
		this.cBillProjectMap = cBillProjectMap;
	}

}
