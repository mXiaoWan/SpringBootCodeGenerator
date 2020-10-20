package ${packageName}.service;

import java.util.Map;
import java.util.List;
import ${packageName}.api.vo.${classInfo.className?uncap_first}.${classInfo.className}PageableVO;
import ${packageName}.common.vo.PageResp;
import ${packageName}.entity.${classInfo.className};


/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
public interface ${classInfo.className}Service {

    /**
    * 新增
    */
    public Long insert(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 删除
    */
    public Long delete(Long id);

    /**
    * 更新
    */
    public Long update(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 根据主键 id 查询
    */
    public ${classInfo.className} load(Long id);

    /**
    * 查询列表
    */
    List<${classInfo.className}> list(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO);

    /**
    * 分页查询
    */
    PageResp<${classInfo.className}> pageList(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO);
}
