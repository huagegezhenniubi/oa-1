package com.friends.service.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import com.friends.dao.MfMyCollectionDao;
import com.friends.entity.MfActivityReview;
import com.friends.entity.MfClassMv;
import com.friends.entity.MfMyCollection;
import com.friends.entity.vo.MfMyCollectionDynamicQueryVo;
import com.friends.service.MfMyCollectionService;
import com.friends.utils.Result;

@Service
public class MfMyCollectionServiceImpl extends BaseService<MfMyCollectionDao, MfMyCollection>
		implements MfMyCollectionService {

	@Autowired
	MfMyCollectionDao mfMyCollectionDao;
	@Autowired
	EntityManager em;

	// 通用方法在base层已经有了

	// 动态结构查询
	// Spring-data-jpa-specification形式较简单,但只适用于单表动态结构查询
	// entityManager形式稍复杂，但能实现多表动态约束查询。但多表时jpa返回的是object[][],需要借助工具转成对象。
	// entityManager方式
	@SuppressWarnings("unchecked")
	public Result queryDynamic(MfMyCollectionDynamicQueryVo mfMyCollectionDynamicQueryVo) {
		int page = mfMyCollectionDynamicQueryVo.getPage();
		int pageSize = mfMyCollectionDynamicQueryVo.getPageSize();
		MfMyCollection mfMyCollection = mfMyCollectionDynamicQueryVo.getT();

		// 多表sqlCommonBody查询 返回单表数据
		StringBuilder sqlCommonBody = new StringBuilder();
		sqlCommonBody.append(" from mf_my_collection t where 1=1 ");

		// 遍历每个字段 发现约束类型不为NO的，则根据情况进行约束
		// 如果判空也得分类型：字符串与非字符串
		// 时间要模糊约束怎么办

		String sqlDataQuery = " select distinct t.* " + sqlCommonBody.toString() + " limit :from, :to ";
		String sqlCountQuery = " select count(1) " + sqlCommonBody.toString();
		Query dataQuery = em.createNativeQuery(sqlDataQuery, MfMyCollection.class);
		Query countQuery = em.createNativeQuery(sqlCountQuery);
		// 参数注入
		dataQuery.setParameter("from", (page * pageSize));
		dataQuery.setParameter("to", pageSize);

		// 多表需要使用object[][]来接收 并通过BeanHelper工具将其转换为与sql中结果集字段对应的bean
		List<MfMyCollection> list = dataQuery.getResultList();
		// BeanHelper.objectsListToEntity(List<Object[]> objectsList, Class<T>
		// c)
		int total = Integer.valueOf(countQuery.getSingleResult().toString());
		return new Result(list, total);
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public Result queryByUserId(String id, PageRequest pageRequest) {
		int page = pageRequest.getPageNumber();
		int pageSize = pageRequest.getPageSize();
		
		StringBuilder sqlCommonBody = new StringBuilder();
		sqlCommonBody.append(" from mf_my_collection m left join mf_activity_review a on(m.activity_id=a.id)");
		sqlCommonBody.append(" where 1=1 and m.user_id=:id and m.activity_id is not null ");
		
		String sqlDataQuery = "select a.* " + sqlCommonBody.toString() + " limit :from, :to ";
		String sqlCountQuery = "select count(1) " + sqlCommonBody.toString();
		Query dataQuery = em.createNativeQuery(sqlDataQuery, MfActivityReview.class);
		Query countQuery = em.createNativeQuery(sqlCountQuery);
		
		// 参数注入
		dataQuery.setParameter("from", (page * pageSize));
		dataQuery.setParameter("to", pageSize);
		dataQuery.setParameter("id", id);
		countQuery.setParameter("id", id);
		
		List<MfActivityReview> list = dataQuery.getResultList();
		int total = Integer.valueOf(countQuery.getSingleResult().toString());
		return new Result(list, total);
	}


	@SuppressWarnings("unchecked")
	@Override
	public Result queryClassroomById(String id, PageRequest pageRequest) {
		int page = pageRequest.getPageNumber();
		int pageSize = pageRequest.getPageSize();
		
		StringBuilder sqlCommonBody = new StringBuilder();
		sqlCommonBody.append(" from mf_my_collection m left join mf_class_mv c on(m.video_id=c.id)");
		sqlCommonBody.append(" where 1=1 and m.user_id=:id and m.video_id is not null ");
		
		String sqlDataQuery = "select c.* " + sqlCommonBody.toString() + " limit :from, :to ";
		String sqlCountQuery = "select count(1) " + sqlCommonBody.toString();
		Query dataQuery = em.createNativeQuery(sqlDataQuery, MfClassMv.class);
		Query countQuery = em.createNativeQuery(sqlCountQuery);
		
		// 参数注入
		dataQuery.setParameter("from", (page * pageSize));
		dataQuery.setParameter("to", pageSize);
		dataQuery.setParameter("id", id);
		countQuery.setParameter("id", id);
		
		List<MfClassMv> list = dataQuery.getResultList();
		int total = Integer.valueOf(countQuery.getSingleResult().toString());
		return new Result(list, total);
	}

}
