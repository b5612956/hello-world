// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.test.panda.domain.web;

import com.test.panda.domain.SelectCandidate;
import com.test.panda.domain.web.SelectCandidateController;
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

privileged aspect SelectCandidateController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SelectCandidateController.create(@Valid SelectCandidate selectCandidate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, selectCandidate);
            return "selectcandidates/create";
        }
        uiModel.asMap().clear();
        selectCandidate.persist();
        return "redirect:/selectcandidates/" + encodeUrlPathSegment(selectCandidate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SelectCandidateController.createForm(Model uiModel) {
        populateEditForm(uiModel, new SelectCandidate());
        return "selectcandidates/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SelectCandidateController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("selectcandidate", SelectCandidate.findSelectCandidate(id));
        uiModel.addAttribute("itemId", id);
        return "selectcandidates/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SelectCandidateController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("selectcandidates", SelectCandidate.findSelectCandidateEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) SelectCandidate.countSelectCandidates() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("selectcandidates", SelectCandidate.findAllSelectCandidates(sortFieldName, sortOrder));
        }
        return "selectcandidates/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SelectCandidateController.update(@Valid SelectCandidate selectCandidate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, selectCandidate);
            return "selectcandidates/update";
        }
        uiModel.asMap().clear();
        selectCandidate.merge();
        return "redirect:/selectcandidates/" + encodeUrlPathSegment(selectCandidate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SelectCandidateController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, SelectCandidate.findSelectCandidate(id));
        return "selectcandidates/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SelectCandidateController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SelectCandidate selectCandidate = SelectCandidate.findSelectCandidate(id);
        selectCandidate.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/selectcandidates";
    }
    
    void SelectCandidateController.populateEditForm(Model uiModel, SelectCandidate selectCandidate) {
        uiModel.addAttribute("selectCandidate", selectCandidate);
    }
    
    String SelectCandidateController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
