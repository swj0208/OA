package com.yc.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * 所有审批流转的处理动作
 *
 */
@RestController
public class ApprovalFlowController {
	
	//跳转到起草申请页面
	@RequestMapping("/toShowNewApproval.action")
	public ModelAndView toShowNewApproval() {
		return new ModelAndView("approval/newApproval");
	}
}
