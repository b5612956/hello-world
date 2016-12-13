package com.test.panda.domain.web;
import com.test.panda.domain.SelectCandidate;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/selectcandidates")
@Controller
@RooWebScaffold(path = "selectcandidates", formBackingObject = SelectCandidate.class)
public class SelectCandidateController {
}
