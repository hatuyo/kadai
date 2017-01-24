# coding: utf-8
require 'minitest/autorun'
# ピコ太郎を表すクラス
# @author Kento Matsumoto
# @attr [String] name 人の名前
# @attr [String] right 右手の物
# @attr [String] left 左手の物
# @attr [String] result1 合わされた物1
# @attr [String] result2 合わされた物2
class Pico

  attr_accessor :name, :right, :left, :ummm

  # コンストラクタ
  # @param name [String] 人の名前
  # @param right [String] right 右手の物
  # @param left [String] left 左手の物
  # @param [String] result1 合わされた物1
  # @param [String] result2 合わされた物2
  def initialize(name, right, left, result1, result2)
    @name = name
    @right = right
    @left = left
    @result1 = result1
    @result2 = result2
  end

  # 右手になにを持つか決める時に呼ばれるメソッド
  # @param obj [Fixnum] 右手に何をもつか
  # @return [Pico] ピコ太郎を返す
  # @example 右手にペンを持つ
  #   Pico.I_have_a_right("pen")
  def I_have_a_right(obj)
    @right = obj
    self
  end


  # 左手になにを持つか決める時に呼ばれるメソッド
  # @param obj [Fixnum] 左手に何をもつか
  # @return [Pico] ピコ太郎を返す
  # @example 左手にペンを持つ
  #   Pico.I_have_a_left("pen")
  def I_have_a_left(obj)
    @left = obj
    self
  end

  # 両手に何か持ってる時にだけ合体させ、あわよくば終わるメソッド
  # @param left [Fixnum] 左手
  # @param right [Fixnum] 右手
  # @return [Pico] ピコ太郎を返す
  # @example 両手の物を合わせる
  #   Pico.ummm(right,left)
  def ummm(right,left)
    if @right == right &&  @left == left then
      if @result1.empty? then
        @result1 = right + left
      elsif @result2.empty? then
        @result2 = right + left
      else
        puts "ERROR！手に持ってる物がおかしいです"
      end
      if ! @result1.empty? && ! @result2.empty? then
        puts "#{@result1}#{@result2}"
        puts "#{@result1}#{@result2}"
        puts "曲が終わり！"
      end
    end
  end


  tarou = Pico.new("ピコ太郎", "", "", "", "",)
  tarou.I_have_a_right("Pen")
  tarou.I_have_a_left("Pineapple")
  tarou.ummm(tarou.right,tarou.left)
  tarou.I_have_a_left("Apple")
  tarou.I_have_a_right("Pen")
  tarou.ummm(tarou.right,tarou.left)

end

class TestPico　< Minitest::Test

  def setup
    @pc = Pico.new("ピコ太郎", "", "", "", "",)
  end

# I_have_a_rightで右手に持つことをチェック
  def test_I_have_a_right
    @pc.I_have_a_right("Pen")
    assert_equal("Pen", @pc.right)
  end

# I_have_a_leftで左手に持つことをチェック
  def test_I_have_a_left
    @pc.I_have_a_left("Painappow")
    assert_equal("Painappow", @pc.left)
  end

# ummmでresultに合わせた結果入れることをチェック
#メソッドが見つかららない？なぞのエラーにつきテスト断念
  def test_ummm
    @pc.I_have_a_right("Pen")
    assert_equal("Pen", @pc.right)
    @pc.I_have_a_left("Painappow")
    assert_equal("Painappow", @pc.left)
    @pc.ummm(@pc.right,@pc.left)
    assert_equal("PenPainappow", @pc.result1)
  end

end
