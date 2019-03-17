package cn.xhanglog.service.impl;

import cn.xhanglog.dao.ArticalMapper;
import cn.xhanglog.dao.CommentMapper;
import cn.xhanglog.entity.Artical;
import cn.xhanglog.entity.Link;
import cn.xhanglog.service.ArticalService;
import cn.xhanglog.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: Xhang
 */
@Service
@Transactional
public class ArticalServiceImpl implements ArticalService {
    @Autowired
    private ArticalMapper articalMapper;

    @Override
    public List<Artical> getRecommendedArtical() {
        List<Artical> recommendedArtical = articalMapper.getRecommendedArtical();
        return recommendedArtical;
    }

    @Override
    public List<Artical> getClickMostArtical() {
        List<Artical> clickMostArtical = articalMapper.getClickMostArtical();
        return clickMostArtical;
    }

    @Override
    public List<Artical> getCommentMost() {
        return articalMapper.getCommentMost();
    }

    @Override
    public List<Artical> getShowIndexArtical() {
        return articalMapper.getShowIndexArtical();
    }

    @Override
    public Artical getArticalInfoById(Integer id) {
        return articalMapper.getArticalInfoById(id);
    }

    @Override
    public Artical getPreArtical(Integer id) {
        return articalMapper.getPreArtical(id);
    }

    @Override
    public Artical getAfterArtical(Integer id) {
        return articalMapper.getAfterArtical(id);
    }

    @Override
    public Page<Artical> getArticalListByTagId(Integer tagId, Integer page, Integer rows) {
        Page<Artical> re = new Page<>();
        //开始行
        Integer startRow = (page-1) * rows;
        List<Artical> articalList = articalMapper.getArticalListByTagId(tagId, startRow ,rows);
        Integer count = articalMapper.getArticalCountByTagId(tagId);
        re.setPage(page);
        re.setRows(articalList);
        re.setSize(rows);
        re.setTotal(count);
        return re;
    }

    @Override
    public Page<Artical> getArticalListByMenuId(Integer menuId,Integer page, Integer rows) {
        Page<Artical> re = new Page<>();
        //开始行
        Integer startRow = (page-1) * rows;
        List<Artical> articalList = articalMapper.getArticalListByMenuId(menuId, startRow, rows);
        Integer count = articalMapper.getArticalCountByMenuId(menuId);
        re.setPage(page);
        re.setRows(articalList);
        re.setSize(rows);
        re.setTotal(count);
        return re;
    }

    @Override
    public Page<Artical> getArticalsBySearch(String keyword, Integer page, Integer rows) {
        Page<Artical> re = new Page<>();
        //开始行
        Integer startRow = (page-1) * rows;
        List<Artical> articalList = null;
        Integer count = 0;
        if(keyword != null){
            String key = keyword.trim();
            articalList = articalMapper.getArticalsBySearch(key, startRow, rows);
            count = articalMapper.getArticalCountBySearch(key);
        }
        re.setPage(page);
        re.setRows(articalList);
        re.setSize(rows);
        re.setTotal(count);
        return re;
    }

    @Override
    public void addArticalLookCount(Integer id) {
        articalMapper.addArticalLookCount(id);
    }

    @Override
    public void addCommentCount(Integer articalID) {
        articalMapper.addCommentCount(articalID);
    }

}
