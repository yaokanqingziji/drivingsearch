package com.external.weixin.scene.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.external.weixin.scene.bpo.SceneBpo;
import com.external.weixin.scene.domain.SceneDomain;
import com.external.weixin.scene.service.SceneService;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseService;

@Service("com.external.weixin.scene.service.impl.SceneServiceImpl")
public class SceneServiceImpl extends SearchBaseService implements SceneService {

	@Autowired
	private SceneBpo sceneBpo;

	@Override
	public String addScene(SceneDomain sceneDomain) throws BaseException {

		return sceneBpo.addScene(sceneDomain);
	}

}
