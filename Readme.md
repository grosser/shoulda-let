A simple let for shoulda

Install
=======

    gem install shoulda-let

    # Gemfile
    gem "shoulda-let", :require => "shoulda/let"

Usage
=====
<!-- example -->
    context "let" do
      let(:thing){ "a thing" }

      should "make the result available via let" do
        assert_equal 'a thing', let(:thing)
      end

      should 'make the result available via an instance method' do
        assert_equal 'a thing', thing
      end

      context "memoization" do
        let(:thing) do
          @invocations ||= 0
          @invocations += 1
          rand
        end

        should "be stable" do
          first_value = thing
          assert_equal first_value, thing
          assert_equal first_value, let(:thing)
        end

        should 'not reevaluate' do
          thing; thing; thing
          assert_equal 1, @invocations
        end
      end

      context "a child context with an overridden let" do
        let(:thing) { 'child thing' }

        should "use the overridden value" do
          assert_equal "child thing", thing
        end
      end

      context 'a child context with no overridden let' do
        should 'use the parent value' do
          assert_equal 'a thing', thing
        end
      end

      context "let!" do
        let!(:thing) do
          @thing_instantiated = true
          'anything'
        end

        should "automatically be evaluated" do
          assert @thing_instantiated
        end

        should 'otherwise work like let' do
          assert_equal 'anything', thing
        end
      end

      context 'evaluation context' do
        let(:thing) do
          @let_evaluation_context = self
          'a thing'
        end

        should 'be the test case' do
          thing
          assert_equal self, @let_evaluation_context
        end
      end
    end
<!-- example -->
Author
======

### [Contributors](https://github.com/grosser/shoulda-let/contributors)
 - [James Rosen](https://github.com/jamesarosen)

[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT<br/>
[![Build Status](https://travis-ci.org/grosser/shoulda-let.png)](http://travis-ci.org/grosser/shoulda-let)
