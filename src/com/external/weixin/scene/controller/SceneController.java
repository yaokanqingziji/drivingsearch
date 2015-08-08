package com.external.weixin.scene.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.external.weixin.scene.domain.SceneDomain;
import com.external.weixin.scene.service.SceneService;
import com.ldw.frame.base.BaseException;
import com.search.base.SearchBaseController;

@Controller
@RequestMapping("/scene")
public class SceneController extends SearchBaseController {
	@Autowired
	private SceneService sceneService;

	@RequestMapping("/addScene")
	@ResponseBody
	public String addScene(ModelMap map, HttpServletRequest request,
			SceneDomain sceneDomain) throws BaseException {
		sceneService.addScene(sceneDomain);
		return "ok";
	}
}