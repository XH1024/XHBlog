package cn.xhanglog.controller;

import cn.xhanglog.entity.Member;
import cn.xhanglog.service.MemberService;
import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.javabeans.qzone.UserInfoBean;
import com.qq.connect.oauth.Oauth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;


/**
 * 会员Controller层
 *
 * @Author: Xhang
 */
@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @RequestMapping(value = {"/qqLogin"})
    public void qqLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        try {
            response.sendRedirect(new Oauth().getAuthorizeURL(request));
        } catch (QQConnectException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = {"/afterQqLogin"})
    public String qqSuccess(HttpServletRequest request,HttpServletResponse response)
            throws IOException, ParseException, QQConnectException {

        //设置编码格式
        response.setContentType("text/html;charset=utf-8");

        //默认token，openid
        String accessToken = null;
        String openID = null;
        String qqname = null;//qq昵称
        String gender = null;//性别
        String msg = null;//异常，用于判定openID时使用，如果说openID是空，那么就使用这个addattribute（“msg”,"错误"）
        String avatar = null;//接收头像所在地址，然后在前台使用《img》进行接收
        try {
            AccessToken accessTokenObj = (new Oauth()).getAccessTokenByRequest(request);

            //进行判断
            if (accessTokenObj.getAccessToken().equals("")) {
                System.out.println("没有获取到相应参数");
            } else {
                accessToken = accessTokenObj.getAccessToken();
                //利用获取的accessTokenm，去获取当前的openID
                OpenID openIDObj = new OpenID(accessToken);
                openID = openIDObj.getUserOpenID();
            }
        } catch (QQConnectException e) {
            e.printStackTrace();
            System.out.println("产生异常的原因是：" + e.getMessage());
        }
        if (openID == null) {
            request.setAttribute("msg", "没有参数哈哈哈哈");
            /*return "qq/qqerror";*///发生错误直通错误jsp页面
        } else {
            //获得空间个人实例对象
            UserInfo qzoneUserInfo = new UserInfo(accessToken, openID);
            UserInfoBean userInfoBean = qzoneUserInfo.getUserInfo();

            //获取qq名称
            qqname = userInfoBean.getNickname();
            //获取性别
            gender = userInfoBean.getGender();
            //获取图片
            avatar = userInfoBean.getAvatar().getAvatarURL50();

            Member member = new Member();

            member.setMemberId(openID);
            member.setMemberNickname(qqname);
            member.setMemberImage(avatar);
            if (gender.equals("男")){
                member.setSex(true);
            }else {
                member.setSex(false);
            }
            member.setComment(true);
            Member mem = memberService.getMemberById(openID);
            if(mem == null){
                memberService.addMember(member);
            }
        }
        request.getSession().setAttribute("openID",openID);
        request.getSession().setAttribute("qqname",qqname);
        request.getSession().setAttribute("avatar",avatar);
        return "redirect:/index.html";

    }
}
