# selection_test.rb

# The Clever Algorithms Project: http://www.CleverAlgorithms.com
# (c) Copyright 2010 Jason Brownlee. Some Rights Reserved. 
# This work is licensed under a Creative Commons Attribution-Noncommercial-Share Alike 2.5 Australia License.


require 'test/unit'

require 'selection_lib'

# http://ruby-doc.org/stdlib/libdoc/test/unit/rdoc/classes/Test/Unit.html
# http://ruby-doc.org/stdlib/libdoc/test/unit/rdoc/classes/Test/Unit/Assertions.html

# 
# Test the selection class
# 
class TestSelectionLib < Test::Unit::TestCase
  
  TEST_QUERY = "%22genetic+algorithm%22"
  TEST_QUERY_NO_RESULTS = "%22this+will+return+no_results+ok%22"

#  return results

  def test_get_approx_google_web_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_google_web_results(TEST_QUERY)
        # puts "test_get_approx_google_web_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :>, 0, "query unexpectedly did not return any results")
  end

  def test_get_approx_google_book_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_google_book_results(TEST_QUERY)
        # puts "test_get_approx_google_book_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :>, 0, "query unexpectedly did not return any results")
  end
  
  def test_get_approx_google_scholar_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_google_scholar_results(TEST_QUERY)
        # puts "test_get_approx_google_scholar_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :>, 0, "query unexpectedly did not return any results")
  end
  
  def test_get_approx_springer_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_springer_results(TEST_QUERY)
        # puts "test_get_approx_springer_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :>, 0, "query unexpectedly did not return any results")
  end
  
  def test_get_approx_scirus_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_scirus_results(TEST_QUERY)
        # puts "test_get_approx_scirus_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :>, 0, "query unexpectedly did not return any results")
  end
    
  def test_get_approx_ieee_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_ieee_results(TEST_QUERY)
        # puts "test_get_approx_ieee_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :>, 0, "query unexpectedly did not return any results")
  end 
   
   
#  return no results

  def test_get_approx_google_web_no_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_google_web_results(TEST_QUERY_NO_RESULTS)
        # puts "test_get_approx_google_web_no_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :==, 0, "query unexpectedly returned results")
  end
  
  def test_get_approx_google_book_no_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_google_book_results(TEST_QUERY_NO_RESULTS)
        # puts "test_get_approx_google_book_no_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :==, 0, "query unexpectedly returned results")
  end
  
  def test_get_approx_google_scholar_no_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_google_scholar_results(TEST_QUERY_NO_RESULTS)
        # puts "test_get_approx_google_scholar_no_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :==, 0, "query unexpectedly returned results")
  end
  
  def test_get_approx_springer_no_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_springer_results(TEST_QUERY_NO_RESULTS)
        # puts "test_get_approx_springer_no_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :==, 0, "query unexpectedly returned results")
  end
  
  def test_get_approx_scirus_no_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_scirus_results(TEST_QUERY_NO_RESULTS)
        # puts "test_get_approx_scirus_no_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")        
    assert_operator(rs.to_i, :==, 0, "query unexpectedly returned results")
  end

  def test_get_approx_ieee_no_results
    rs = nil
    assert_nothing_raised do
        rs = get_approx_ieee_results(TEST_QUERY_NO_RESULTS)
        # puts "test_get_approx_ieee_no_results got: " + rs
    end
    assert(!rs.nil?, "result is nil") 
    assert(!rs.empty?, "result is empty")
    assert_operator(rs.to_i, :==, 0, "query unexpectedly returned results")
  end   
   
  
end