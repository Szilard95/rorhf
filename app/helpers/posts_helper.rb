module PostsHelper
  class CommentTree

    def initialize(comments)
      @comments = comments
      @rendered = Set.new
      @to_render = []
    end

    def render
      dfs Comment.new(id: nil)
      @to_render
    end

    private

    def dfs(comment, level = -1)
      comment.level = level
      @rendered.add(comment)
      @to_render.push(comment) unless comment.id.nil?
      get_children(comment).each {|c| dfs c, level + 1 unless @rendered.include? c}
    end

    def get_children(comment)
      ret = []
      @comments.each {|c| ret.push(c) if c.parent_id == comment.id}
      ret
    end

  end
end
