package ${packageName}.api.rpc.service;

import com.xiaomi.data.push.common.Health;
import ${packageName}.api.vo.${classInfo.className?uncap_first}.${classInfo.className}PageableVO;
import ${packageName}.api.vo.${classInfo.className?uncap_first}.${classInfo.className}VO;
import ${packageName}.common.vo.IdVO;
import ${packageName}.common.vo.PageResp;
import com.xiaomi.youpin.infra.rpc.Result;

import java.util.List;


/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
public interface ${classInfo.className}RpcService {

    /**
    * 新增
    */
    Result<Long> insert(${classInfo.className}VO ${classInfo.className?uncap_first}VO);

    /**
    * 删除
    */
    Result<Long> delete(IdVO id);

    /**
    * 更新
    */
    Result<Long> update(${classInfo.className}VO ${classInfo.className?uncap_first}VO);

    /**
    * 根据主键 id 查询
    */
    Result<${classInfo.className}VO> load(IdVO id);

    /**
    * 查询列表
    */
    Result<List<${classInfo.className}VO>> list(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO);

    /**
    * 分页查询
    */
    Result<PageResp<${classInfo.className}VO>> pageList(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO);

    /**
    * 返回变更后的状态
    */
    Result<Integer> toggleState(IdVO id);
}
