require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  test "should not save article without title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end

  test "should not save an article that is too short" do
    article = Article.new
    article.title = "This is a test article"
    article.text = "too short"
    assert_not article.save, "Saved the article that was too short"
  end

  test "should save an article that meets validation" do
    article = Article.new
    article.title = "This is a test article"
    article.text = "This is an example of an article that validates"
    assert article.save, "Valid article was not saved"
  end

  test "should read a saved article" do
    article = Article.new
    article.title = "This is a test article"
    article.text = "This is an example of an article that validates"
    article.save
    id = article.id

    assert_equal Article.find(id).title, "This is a test article",
      "Read article title does not match saved article title"

    assert_equal Article.find(id).text,
      "This is an example of an article that validates",
      "Read article text does not match saved article text"
  end

end
