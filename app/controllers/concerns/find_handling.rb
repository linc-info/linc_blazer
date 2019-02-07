module Concerns::FindHandling
  extend ActiveSupport::Concern
  OPEN_COURSE_TYPE = "open_course"
  ARTICLE_TYPE = "article"
  PAGE_SIZE = 10

  def get_index(page, type)
    @page = page.to_i > 0 ? page.to_i : 1
    if type == OPEN_COURSE_TYPE
      open_course_index PAGE_SIZE
    elsif type == ARTICLE_TYPE
      article_index PAGE_SIZE
    else
      (open_course_index(PAGE_SIZE / 2) + article_index(PAGE_SIZE / 2)).sort {|f| f[:createdTime]}
    end
  end

  def open_course_index(page_size)
    open_course_find_format OpenCourse.where(status: "published").order(createdTime: :desc).limit(page_size).offset((@page - 1) * page_size)
  end

  def open_course_find_format(open_courses)
    open_courses.to_a.map {|oc| {id: oc.id, title: oc.title, img: oc.img, hit: oc.hitNum, like: oc.open_course_likes.count, createdTime: oc.createdTime, type: OPEN_COURSE_TYPE}}
  end

  def article_index(page_size)
    article_index_find_format Article.all.order(createdTime: :desc).limit(page_size).offset((@page - 1) * page_size)
  end

  def article_index_find_format(articles)
    articles.to_a.map {|a| {id: a.id, title: a.title, img: a.img, hit: a.hits, like: a.article_likes.count, createdTime: a.createdTime, type: ARTICLE_TYPE}}
  end

  def get_recommend
    open_courses = open_course_find_format OpenCourse.where(status: "published", ).order(createdTime: :desc).limit(3)
    articles = article_index_find_format Article.all.order(createdTime: :desc).limit(3)
    (open_courses + articles).sort {|f| f[:createdTime]}
  end

end