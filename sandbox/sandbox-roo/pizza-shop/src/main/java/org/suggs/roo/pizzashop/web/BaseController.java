package org.suggs.roo.pizzashop.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.suggs.roo.pizzashop.domain.Base;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "bases", formBackingObject = Base.class)
@RequestMapping("/bases")
@Controller
public class BaseController {
}
