package com.test.panda.domain.web;
import com.test.panda.domain.Positions;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/positionses")
@Controller
@RooWebScaffold(path = "positionses", formBackingObject = Positions.class)
public class PositionsController {
}
