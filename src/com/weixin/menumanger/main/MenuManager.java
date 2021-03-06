package com.weixin.menumanger.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.weixin.course.menu.Button;
import com.weixin.course.menu.ClickButton;
import com.weixin.course.menu.ComplexButton;
import com.weixin.course.menu.Menu;
import com.weixin.course.menu.ViewButton;
import com.weixin.course.pojo.Token;
import com.weixin.course.util.CommonUtil;
import com.weixin.course.util.MenuUtil;

/**
 * 菜单管理器类
 * 
 * @author wuzhe
 * @date 2015-02-28
 */
public class MenuManager {
	private static Logger log = LoggerFactory.getLogger(MenuManager.class);

	/**
	 * 定义菜单结构
	 * 
	 * @return
	 */
	private static Menu getMenu() {
		
		//第一个一级菜单
//		ViewButton btn11 = new ViewButton();
//		btn11.setName("来个代驾");
//		btn11.setType("view");
//		btn11.setUrl("http://115.28.180.16/drivingsearch?uid=201508142125");
//		btn11.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6350ba04eff526f5&redirect_uri=http%3A%2F%2F115.28.180.16%2Fdrivingsearch%2FoauthServlet&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect");
		
		ClickButton btn11 = new ClickButton();
		btn11.setName("来个代驾");
		btn11.setType("click");
		btn11.setKey("laigedaijia");
		
		ClickButton btn12 = new ClickButton();
		btn12.setName("一键叫代驾");
		btn12.setType("click");
		btn12.setKey("yjjdj");
		
		//第二个一级菜单
		ClickButton btn21 = new ClickButton();
		btn21.setName("优惠活动");
		btn21.setType("click");
		btn21.setKey("yhhd");
		
		//第三个一级菜单的第一个子菜单
		ViewButton btn31 = new ViewButton();
		btn31.setName("关于我们");
		btn31.setType("view");
		btn31.setUrl("http://115.28.180.16/drivingsearch/pages/html/lailai.jsp");
		
		//第三个一级菜单的第二个子菜单
		ViewButton btn32 = new ViewButton();
		btn32.setName("用户协议");
		btn32.setType("view");
		btn32.setUrl("http://115.28.180.16/drivingsearch/pages/html/yhxy.jsp");
		
		//第三个一级菜单的第三个子菜单
		ClickButton btn33 = new ClickButton();
		btn33.setName("问题反馈");
		btn33.setType("click");
		btn33.setKey("wtfk");
		
		//第三个一级菜单的第四个子菜单
//		ViewButton btn34 = new ViewButton();
//		btn34.setName("代驾合作");
//		btn34.setType("view");
//		btn34.setUrl("http://www.duopao.com");
		
		ClickButton btn34 = new ClickButton();
		btn34.setName("代驾合作");
		btn34.setType("click");
		btn34.setKey("djhz");
		
		ViewButton btn35 = new ViewButton();
		btn35.setName("问卷调查");
		btn35.setType("view");
		btn35.setUrl("http://www.lediaocha.com/m/s/fqwhvu");
		
//		ViewButton btn36 = new ViewButton();
//		btn36.setName("问卷调查1");
//		btn36.setType("view");
//		btn36.setUrl("tel:15020012396");

		//第三个一级菜单
		ComplexButton mainBtn3 = new ComplexButton();
		mainBtn3.setName("关于我们");
		mainBtn3.setSub_button(new Button[] { btn31,btn32,btn33,btn34,btn35});
		
		ComplexButton mainBtn2 = new ComplexButton();
		mainBtn2.setName("来个代驾");
		mainBtn2.setSub_button(new Button[] { btn11,btn12});
		
		//生成菜单
		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn2, btn21, mainBtn3 });

		return menu;
	}

	public static void main(String[] args) {
		//测试微信号： gh_ca2cf140c207
		//生产环境
		// 第三方用户唯一凭证
		String appId = "wx22133dfb2266f29d";
		// 第三方用户唯一凭证密钥
		String appSecret = "853e4417d6c80d01a7039ee47979a329";
		
		//测试环境
//		String appId = "wx6350ba04eff526f5";
//		// 第三方用户唯一凭证密钥
//		String appSecret = "6fc66c0c5b9488bc8d38b6d08443935b";

		// 调用接口获取凭证
		Token token = CommonUtil.getToken(appId, appSecret);

		if (null != token) {
			// 创建菜单
			boolean result = MenuUtil.createMenu(getMenu(), token.getAccessToken());

			// 判断菜单创建结果
			if (result){
				log.info("菜单创建成功！");
				System.out.println("菜单创建成功");
			}
			else{
				log.info("菜单创建失败！");
				System.out.println("菜单创建失败");
			}
				
		}
	}
}
