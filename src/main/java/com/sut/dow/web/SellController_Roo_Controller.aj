// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sut.dow.web;

import com.sut.dow.domain.Sell;
import com.sut.dow.web.SellController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect SellController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SellController.create(@Valid Sell sell, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sell);
            return "sells/create";
        }
        uiModel.asMap().clear();
        sell.persist();
        return "redirect:/sells/" + encodeUrlPathSegment(sell.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SellController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Sell());
        return "sells/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SellController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("sell", Sell.findSell(id));
        uiModel.addAttribute("itemId", id);
        return "sells/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SellController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sells", Sell.findSellEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Sell.countSells() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sells", Sell.findAllSells(sortFieldName, sortOrder));
        }
        return "sells/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SellController.update(@Valid Sell sell, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sell);
            return "sells/update";
        }
        uiModel.asMap().clear();
        sell.merge();
        return "redirect:/sells/" + encodeUrlPathSegment(sell.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SellController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Sell.findSell(id));
        return "sells/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SellController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Sell sell = Sell.findSell(id);
        sell.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/sells";
    }
    
    void SellController.populateEditForm(Model uiModel, Sell sell) {
        uiModel.addAttribute("sell", sell);
    }
    
    String SellController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
