<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\ArticleModel;
use Home\Model\CommentModel;
use Think\Model;

class ArticleController extends HomeBaseController {
    /**文章添加***/
	public function art_add(){
		$User = M("User");
		$user_list = $User->where('status=1')->select();
		$this->assign('user_list',$user_list);  //文章添加人
		$this->display();					
	}
	
	/***新增的文章接口***/
	public function art_insert(){		
		$data['time'] = time();
		$model = new ArticleModel();	
		$data = $model->create();	
		$model->add($data);
		$this->success('添加成功',U('Article/art_list'));
	}
		
	/**文章列表**/
	public function art_list() {
		$class = (int)I('class');    //文章类型
		$article = M('article');
		if (empty($class)){
			$where="ar.user_id=ur.id AND ar.`status`=1";
		}else {
			$where="ar.user_id=ur.id AND ar.`status`=1 AND ar.class=$class";
		}
		$count=	$article->table('erp_article as ar,erp_user as ur')
				->where($where)
				->count();       // 查询满足要求的总记录数        
		$Page = new \Think\Page($count,10);  // 实例化分页类 传入总记录数和每页显示的记录数(10)
		$show = $Page->show();  // 分页显示输出
		$list = $article->table('erp_article as ar,erp_user as ur')
				->where($where)
				->limit($Page->firstRow.','.$Page->listRows)->order('time desc')
		 		->getField("ar.id as id,ar.title as title,ar.time as time,ar.content as content,ar.class as class,ur.realname as realname");
		$this->assign('list',$list);
		$this->assign('page',$show);
		$this->display();		
	}
	
	/*查看文章详情*/
	public function art_detailed(){		
		$id = (int)I('id');  
 		$prev = (int)I('id')-1;
 	    $next = (int)I('id')+1;
        $art = M('Article'); //获取文章详细信息
        //取得article表中最大的id
        $big = $art->where('`status`=1')->max('id')+1;

		$list = $art->table('erp_article as ar,erp_user as ur')
		->where('ar.user_id=ur.id AND ar.id='.$id)
		->getField("ar.id as id,ar.title as title,ar.time as time,ar.content as content,ar.class as class,ar.`status` as `status`,ur.realname as realname");

		$prev_title=$art->where('id='.$prev)->getField('title');
		$next_title=$art->where('id='.$next)->getField('title');		
		$this->assign('id',$id); //当前文章的id
		$this->assign('prev',$prev); //上一条文章是id
		$this->assign('prev_title',$prev_title); //上一条文章是标题
		$this->assign('next',$next);  //下一条文章的id
		$this->assign('next_title',$next_title); //上一条文章是标题		
		$this->assign('big',$big);  //最大的 id+1
		$this->assign('content',htmlspecialchars_decode($list[$id]['content']));//HTML实体转换为字符     文章的内容
		$this->assign('list',$list);

		$comment = M('Comment'); //获取文章评论信息
		$data = $comment->table('erp_comment as co,erp_user as ur')
		->where('co.user_id=ur.id AND co.art_id='.$id)
		->getField("co.id as id,co.add_time as add_time,co.content as content,ur.realname as realname");
		$this->assign('data',$data);
		$this->display();
	}
	/***文章评论的添加***/
	public function insert_comment(){		
		$data['add_time'] = time();  //评论的时间
		$data['user_id'] = UID;   //参与评论的员工
		$data['art_id'] = (int)I('id');     //参与评论的文章id
		$data['content'] = I('param.content');  //评论的内容		
		$model = new CommentModel();		
		$data = $model->create($data);	
		$model->add();
		$this->success('添加成功');
	}			
}