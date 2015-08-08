package com.external.weixin.scene.service;

import com.external.weixin.scene.domain.SceneDomain;
import com.ldw.frame.base.BaseException;

public interface SceneService {

 public String addScene(SceneDomain sceneDomain) throws BaseException;
}