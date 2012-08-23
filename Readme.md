A simple let for shoulda

Install
=======

    gem install shoulda-let

    # Gemfile
    gem "shoulda-let", :require => "shoulda/let"

Usage
=====
<!-- example -->
    context "foo" do
      setup do
        @result = let(:thing)
      end

      let(:thing){ "parent" }

      context "with something" do
        let(:thing){ "something" }
        should "be something" do
          assert_equal "something", @result
        end
      end

      context "with cache" do
        let(:thing){ rand }

        should "be stable" do
          assert_equal @result, let(:thing)
        end

        should "be different" do
          assert_not_equal $last_thing, let(:thing)
        end

        should "prepare for be different" do
          $last_thing = let(:thing)
        end
      end

      context "with parent" do
        should "be parent" do
          assert_equal "parent", @result
        end
      end
    end
<!-- example -->
Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT<br/>
[![Build Status](https://secure.travis-ci.org/grosser/shoulda_let.png)](http://travis-ci.org/grosser/shoulda_let)
