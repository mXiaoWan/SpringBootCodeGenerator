import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Mapper
@Repository
public interface ${classInfo.className}Mapper {

    /**
    * 新增
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    Long insert(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 刪除
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    Long delete(Long id);

    /**
    * 更新
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    Long update(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 查询 根据主键 id 查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    ${classInfo.className} load(Long id);

    /**
    * 查询 分页查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    List<${classInfo.className}> pageList(Long offset,Long pagesize);

    /**
    * 查询 分页查询 count
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    Long pageListCount(Long offset,Long pagesize);

}
