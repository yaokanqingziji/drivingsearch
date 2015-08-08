package com.external.weixin.scene.bpo;

import com.external.weixin.scene.domain.SceneDomain;
import com.ldw.frame.base.BaseException;

public interface SceneBpo {
	public String addScene(SceneDomain sceneDomain) throws BaseException;
}
