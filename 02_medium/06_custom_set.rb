class CustomSet
  def initialize(collection = [])
    @collection = collection
  end

  def empty?
    collection.empty?
  end

  def contains?(num)
    collection.include?(num)
  end

  def subset?(other)
    collection.all? do |num|
      other.collection.include?(num)
    end
  end

  def disjoint?(other)
    collection.none? do |num|
      other.collection.include?(num)
    end
  end

  def eql?(other)
    subset?(other) && other.subset?(self)
  end

  def add(num)
    collection << num
    self
  end

  def intersection(other)
    new_coll = collection.select do |num|
      other.collection.include?(num)
    end
    CustomSet.new(new_coll)
  end

  def difference(other)
    new_coll = collection.reject do |num|
      other.collection.include?(num)
    end
    CustomSet.new(new_coll)
  end

  def union(other)
    CustomSet.new(collection | other.collection)
  end
  # protected

  def ==(other)
    eql?(other)
  end

  attr_reader :collection
end

# Create a custom set type.

# Sometimes it is necessary to define a custom data structure of some type, like a set. 
# In this exercise you will define your own set type. 
# How it works internally doesn't matter, as long as it behaves like a set of unique elements
#  that can be manipulated in several well defined ways.

# In some languages, including Ruby and JavaScript, there is a built-in Set type. 
# For this problem, you're expected to implement your own custom set type. 
# Once you've reached a solution, feel free to play around with using the built-in implementation of Set.

# For simplicity, you may assume that all elements of a set must be numbers.

=begin
1.Understand problem
 -input:
  initialize
  - array or nothing
  contains?
  -integer
  subset?
  -CustomSet object
  disjoint?
  -CustomSet object
  eql?
  -CustomSet object
  add
  -Integer
  intersection
  -CustomSet object
  difference
  -CustomSet object
  union
  -CustomSet object

 -return:
  -input:
  initialize
  - 
  contains?
  -boolean
  subset?
  -boolean
  disjoint?
  -boolean
  eql?
  -boolean
  add
  -CustomSet object
  intersection
  -CustomSet object
  difference
  -CustomSet object
  union
  -CustomSet object
  ==
  - compares elements of set
 -output:
 -rules:
   -explicit:
    -a set contains unique elements
    - these elements can be manipulated in several well defined ways
    - all elements of a set must be numbers
   -implicit:
    - a new set created without arguments is empty
    - contains? verifies if a set contains a certain unique element

    - an empty set is a subset of another empty set
    - an empty set is a sbuset of a non-empty set
    - a non empty set is not a subset of an emty set
    - a set is a subset of the same set of elements
    - a set is a subset of a larger set of elements(if that set contains all elements of subset)
    - set is not a subset whan the larger set does not contain all elements

    - an empty set is disjointed from another empty set
    - an empty set is disjointed from a non empty set
    - a non empty set is disjointed from an empty set
    - a set is not disjointed from another set when they share an element
    - a set is disjointed from another set when they don't share elements

    -an empty set eql another empty set
    -an empty set does not eql a non empty set
    - a non empty set does not eql an emtpy set
    - a set eqls another set if they contain the same elements(regardless of order)
    - set does not equal another set if they don't contain exactly the same elemenst
    - a set eqls another set if they contain exactly the same elements(regardless of duplicats)

    - add returns a set
    - add adds an element to the set
    - if an element already exists, it is not added to the set

    - intersect returns a set
    - an empty set intersection with an empty set returns an empty set
    - an emty set intersection with a non empty set, returns an empty set
    - a non empty set intersection with an empty, returns an empty set
    - an intersection wo shared elements returns an empty set
    - an intersection w shared elements returns set containing shared elements

    - dfifernece between emty and empty returns empty
    - difference between empty and non empty returns empty
    - differnece between non empty and empty returns the non-empty set
    - difference between non empty and non empty returns non shared elements of caller

    - union empty and empty returns empty
    - union empty and non empty return non mepty
    - union non empty and empty returns non empty
    - union non empty and non empty returns set that contains all elements, wo duplicats
2.Examples & test cases
 -classes & methods(# & ::):
 -raised errors:
 -examples:
3.Data structure
4.Algorithm
 -class:
   -constructor:
   -instance method:
   -class method:
=end