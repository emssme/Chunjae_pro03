package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.*;
import kr.co.teaspoon.service.*;
import kr.co.teaspoon.util.*;

import org.json.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

    @Autowired
    HttpSession session;
    @Autowired
    private FileboardService fileboardService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private WinnerService winnerService;
    @Autowired
    private CommunityService communityService;
    @Autowired
    private QnaService qnaService;
    @Autowired
    private EventService eventService;
    @Autowired
    private ApplyService applyService;

    @GetMapping("adminMemberList.do")
    public String adminMemberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        return "/admin/adminMemberList";
    }

    @RequestMapping(value="memberDelete.do", method = RequestMethod.GET)
    public String memberDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        memberService.memberDelete(id);
        session.invalidate();
        return "redirect: adminMemberList.do";
    }
    //공지사항 목록
    @GetMapping("adminNoticeList.do")
    private String NoticeList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET
        page.setType(request.getParameter("type"));             // 검색 타입 SET

        // 페이징에 필요한 데이터 저장
        int total = noticeService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Notice> noticeList = noticeService.noticeList(page);

        model.addAttribute("noticeList", noticeList);          // 공지사항 목록
        model.addAttribute("curPage", curPage);             // 현재 페이지
        model.addAttribute("page", page);                   // 페이징 데이터

        return "/admin/adminNoticeList";
    }
    //공지사항 삭제
    @RequestMapping("noticeDelete.do")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ?Integer.parseInt(request.getParameter("page")) : 1;
        int seq = Integer.parseInt(request.getParameter("seq"));
        noticeService.noticeDelete(seq);
        model.addAttribute("curPage",curPage);
        return "redirect:/admin/adminNoticeList.do";
    }
    // 커뮤니티 리스트
    @GetMapping("adminCommunityList.do")
    private String communityList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String category = request.getParameter("cate");

        CommunityPage page = new CommunityPage();
        page.setCategory(category);                                // 카테고리 데이터 SET
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET
        page.setType(request.getParameter("type"));             // 검색 타입 SET

        // 페이징에 필요한 데이터 저장
        int total = communityService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<CommunityVO> communityList = communityService.communityList(page);
        List<Category> categories = communityService.categoryList();

        model.addAttribute("communityList", communityList);          // 게시글 목록
        model.addAttribute("categories", categories);       // 카테고리 목록
        model.addAttribute("curPage", curPage);             // 현재 페이지
        model.addAttribute("curCategory", category);        // 현재 카테고리
        model.addAttribute("page", page);                   // 페이징 데이터

        return "/admin/adminCommunityList";
    }

    // 커뮤니티 삭제
    @RequestMapping("communityDelete.do")
    public String communityDelete(@RequestParam int cno, HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ?Integer.parseInt(request.getParameter("page")) : 1;
        communityService.communityDelete(cno);
        model.addAttribute("curPage", curPage);
        return "redirect:/admin/adminCommunityList.do";
    }

    //미답변 질문
    @GetMapping("adminQuestionList.do")
    public String getNoAnswerList(HttpServletRequest request, Model model) throws Exception {
        //Page
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();

        int total = qnaService.noAnswerCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);
        model.addAttribute("curPage", curPage);     // 현재 페이지
        model.addAttribute("page", page);           // 페이징 데이터

        //QnaList
        List<Qna> noAnswerList = qnaService.noAnswerList(page);
        model.addAttribute("noAnswerList", noAnswerList);     //QnA 목록
        return "/admin/noAnswerList";
    }

    //자료실
    @GetMapping("adminFileList.do")		//board/list.do
    public String getBoardList(Model model) throws Exception {
        List<Fileboard> fileboardList = fileboardService.fileList();
        model.addAttribute("fileboardList", fileboardList);
        return "/admin/adminFileboard";
    }

    //이벤트
    @GetMapping("adminEventList.do")
    public String getEventList(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();

        // 페이징에 필요한 데이터 저장
        int total = eventService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Event> eventList = eventService.eventList(page);

        model.addAttribute("eventList", eventList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("page", page);


        return "/admin/adminEventList";
    }

    //이벤트 참여자 리스트
    @GetMapping("applyList.do")
    public String applyList(HttpServletRequest request, Model model) throws Exception {
        int eno = Integer.parseInt(request.getParameter("eno"));
        //WinnerList
        List<Apply> applyList = winnerService.applyList(eno);
        model.addAttribute("applyList", applyList);
        model.addAttribute("eno", eno);
        return "/admin/applyList";
    }

    //7명 추첨
    @GetMapping("winners.do")
    public String winners(HttpServletRequest request, Model model) throws Exception {
        int eno = Integer.parseInt(request.getParameter("eno"));

        List<WinnerList> winners = winnerService.winners(eno);
        model.addAttribute("winners", winners);
        model.addAttribute("eno", eno);
        return "/admin/winners";
    }

    //당발 글쓰기
    @GetMapping("winnerInsert.do")
    public String winnerInsert(HttpServletRequest request, Model model) throws Exception {
        int eno = Integer.parseInt(request.getParameter("eno"));
        List<WinnerList> winners = winnerService.winners(eno);
        for(WinnerList winner : winners) {
            String name = winner.getName();
            String firstName = name.substring(0,1);
            String lastName = name.substring(2,3);
            name = firstName+"*"+lastName;

            String id = winner.getId();
            String hiddenid = id.substring(0,4);
            id = hiddenid+"***";

            winner.setName(name);
            winner.setId(id);
        }
        Event event = eventService.eventDetail(eno);
        model.addAttribute("winners", winners);
        model.addAttribute("event", event);

        return "/admin/winnerInsert";
    }

    @PostMapping("winnerInsert.do")
    public String getWinnerInsertPro(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        Winner dto = new Winner();
        dto.setEno(Integer.parseInt(request.getParameter("eno")));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setAuthor((String) session.getAttribute("sid"));
        winnerService.winnerInsert(dto);

        return "redirect:/winner/list.do";
    }
}