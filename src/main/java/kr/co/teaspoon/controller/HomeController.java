package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.*;
import kr.co.teaspoon.service.CommunityService;
import kr.co.teaspoon.service.EventService;
import kr.co.teaspoon.service.NoticeService;
import kr.co.teaspoon.service.QnaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
public class HomeController {
    //http:localhost:8081/pro03_war => / => /WEB-INF/views/index.jsp

    @Autowired
    private EventService eventService;
    @Autowired
    private CommunityService communityService;
    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/")
    public String home(Locale locale, Model model) throws Exception {
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
                DateFormat.LONG, locale);
        String today = dateFormat.format(date);
        model.addAttribute("today", today);
        model.addAttribute("myName", "김보경");


        //event
        List<Event> indexEventList = eventService.indexEvent();
        model.addAttribute("indexEventList", indexEventList);

        //Community
        List<Community> indexComList = communityService.indexComList();
        model.addAttribute("indexComList", indexComList);

        //Notice
        List<Notice> indexNoticeList = noticeService.indexNoticeList();
        model.addAttribute("indexNoticeList", indexNoticeList);

        return "/index";
    }

}
