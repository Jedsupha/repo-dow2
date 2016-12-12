package com.sut.dow.web;
import com.sut.dow.domain.Sell;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sells")
@Controller
@RooWebScaffold(path = "sells", formBackingObject = Sell.class)
public class SellController {
}
