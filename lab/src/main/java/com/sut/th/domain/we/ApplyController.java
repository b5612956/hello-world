package com.sut.th.domain.we;
import com.sut.th.domain.Apply;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/applys")
@Controller
@RooWebScaffold(path = "applys", formBackingObject = Apply.class)
public class ApplyController {
}
