package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Member;

import java.util.List;
import java.util.Map;

public interface MemberDAO {
    public List<Member> memberList () throws Exception;
    public Member getMember(String id);
    public void memberInsert(Member member);
    public Member loginCheck(String id) throws Exception;
    public void memberEdit(Member member) throws Exception;
    public void memberDelete(String id) throws Exception;
    public int memberCnt() throws Exception;
    public Member loginAjax(Member member) throws Exception;
}