
## Exercise

```
=begin
You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints
of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.
Return the maximum amount of water a container can store. Notice that you may not slant the container.

Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
=end

# @param {Integer[]} height
# @return {Integer}
def max_area(height)

end

puts max_area([1,8,6,2,5,4,8,3,7])
```

## Running and Details

Any 3.x version of Ruby will probably work. To run the tests you'll need rspec
but `ruby exercise.rb` has no gem deps--it should just run.

Implementation ended up reasonably efficient (linear time and space complexity).
Feel free to fiddle with the inputs in `exercise.rb`, rerun, and see what you get.

Final code coverage report (HTML) available at [coverage.tgz](./coverage.tgz).

Here is the [output](https://gist.github.com/onethirtyfive/1e4be8a74de156f9e2f17ca1924a721b), if you're in a hurry.


## Commit Play-by-Play

### \#1: Ad hoc devenv for exercise (no code changes)

[6397aa9](https://github.com/onethirtyfive/maxarea/commit/6397aa9)

I love the [Nix Package Manager](https://nix.dev/), but tl;dr: I made a
little `maxarea` devenv which would install identically on any
computer which:

1. has Nix installed,
2. enters this directory and types `nix-shell`

Like so:

```
maxarea on  main [?] via 💎 v2.6.10 took 1m21s
❯ ruby --version
ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin22]

maxarea on  main [?] via 💎 v2.6.10
❯ nix-shell

[nix-shell:~/Code/maxarea]$ ruby --version
ruby 3.3.0preview2 (2023-09-14 master e50fcca9a7) [arm64-darwin22]

[nix-shell:~/Code/maxarea]$ gem list --local

*** LOCAL GEMS ***

[snip]
rspec (3.12.0)
rspec-core (3.12.2)
rspec-expectations (3.12.3)
rspec-mocks (3.12.6)
rspec-support (3.12.1)
[snip]
```

### \#2: exercise implementation

[d333e79](https://github.com/onethirtyfive/maxarea/commit/d333e79)

It's pretty straightforward:

- demo: `ruby exercise.rb`, requries no dependencies
- `lib/area.rb` implements exercise support code
- `spec/lib/area_spec.rb` tests the exercise support code

