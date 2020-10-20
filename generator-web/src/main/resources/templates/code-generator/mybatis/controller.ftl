package ${packageName}.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import ${packageName}.entity.${classInfo.className};
import ${packageName}.api.vo.${classInfo.className?uncap_first}.${classInfo.className}PageableVO;
import ${packageName}.common.vo.PageResp;
import ${packageName}.service.${classInfo.className}Service;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@RestController
@RequestMapping(value = "/${classInfo.className?uncap_first}")
@Api(tags = "${classInfo.classComment}相关接口", description="${classInfo.classComment}")
public class ${classInfo.className}Controller {

    private static final Logger log = LoggerFactory.getLogger(${classInfo.className}Controller.class);
    @Resource
    private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;

    /**
    * 新增
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @RequestMapping("/insert")
    @ApiOperation(value = "新增${classInfo.classComment}")
    public Long insert(${classInfo.className} ${classInfo.className?uncap_first}){
        return ${classInfo.className?uncap_first}Service.insert(${classInfo.className?uncap_first});
    }

    /**
    * 刪除
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @RequestMapping("/delete")
    @ApiOperation(value = "刪除${classInfo.classComment}")
    public Long delete(Long id){
        return ${classInfo.className?uncap_first}Service.delete(id);
    }

    /**
    * 更新
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @RequestMapping("/update")
    @ApiOperation(value = "更新${classInfo.classComment}")
    public Long update(${classInfo.className} ${classInfo.className?uncap_first}){
        return ${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first});
    }

    /**
    * 查询 根据主键 id 查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @RequestMapping("/load")
    @ApiOperation(value = "查询 根据主键 id 查询${classInfo.classComment}")
    public ${classInfo.className} load(Long id){
        return ${classInfo.className?uncap_first}Service.load(id);
    }

    /**
    * 查询 列表
    * @author lizhao
    * @date 2020/10/19
    **/
    @RequestMapping("/list")
    @ApiOperation(value = "查询${classInfo.classComment}列表")
    public List<${classInfo.className}> list(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO) {
        return ${classInfo.className?uncap_first}Service.list(${classInfo.className?uncap_first}PageableVO);
    }

    /**
    * 查询 分页查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @RequestMapping("/pageList")
    @ApiOperation(value = "查询${classInfo.classComment}分页列表")
    public PageResp<${classInfo.className}> pageList(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO) {
        return ${classInfo.className?uncap_first}Service.pageList(${classInfo.className?uncap_first}PageableVO);
    }

}
