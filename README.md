# RMU SESSION 6 EXERCISE 2

If in doubt about how to submit, see SUBMISSION_GUIDELINES file.

In this exercise, we'll be working on improving a game engine for tower defense
games (http://en.wikipedia.org/wiki/Tower_defense). I have already spiked out a
basic proof of concept, and it's now up to you to turn it into something more
solid. The goal here is for students to learn about complex data modeling while
refactoring and extending an existing system.

## GUIDELINES

* This problem has two parts to it, a collaborative component and an individual
  component. Individually, you are expected to add a new type of tower and new
  type of monster to the game. Collaboratively, you are expected to share ideas
  and code for improving the engine so that it can become more suitable running
  a real game.

* To learn how tower defense games work and what their options are, you should
  just go out and play one. A classic is Desktop Tower Defense, but I'm sure
  that you can find many others. This particular variant that I've spiked out
  is inspired by pixeljunk monsters, in that you convert forests into towers
  rather than having to come up with a maze yourself, but this is a feature that
  you can change if you'd like.

* You should discuss your ideas for your monster and tower implementation with
  your fellow students, to avoid duplication of effort. There are nearly
  endless variations that are possible, and pretty much anything you can dream
  up will be acceptable as long as it is sufficiently interesting.

* It is up to you to determine the overall capabilities of the game engine
  (and accordingly, the games that can be built upon it). Right now, there
  is no currency involved, but it'd be a good idea to introduce it to limit
  the number of towers that can be built. There is no concept of levels or
  waves, which might be a good idea to introduce. In fact, very much of the
  engine is still a blank slate. It is both acceptable and encouraged to 
  bring the engine towards a more specific kind of game.

* You do not all need to work off a common codebase, if you wish to break into
  subgroups and explore ideas that aren't compatible with one another, that's
  fine. However, if you want to work together and send pull requests to each
  other (or to an elected 'maintainer'), you're welcome to do so. I will
  evaluate each submission based on the code on your fork, not the original
  codebase.

* You are NOT required to maintain API compatibility with the original
  system, and may change the engine however you'd like. That said, it'd 
  be best to make it so that rather than creating one engine per student,
  you share as much common code as possible with others.

* Currently, the game engine only implements a very rudimentary text based UI,
  and only has a proof of concept event loop. Students are encouraged to work
  together to improve these features so that it's easier to work with the
  system.

* There may be bugs or strange behaviors in the existing system. By your
  final submission these bugs should be resolved and the overall engine
  should be reasonably well factored. In the initial codebase, some areas
  are decent, some are quite ugly.

* Keep a balance between improving the base engine's internals, extending
  its functionality, and producing your monster / tower implementations. Those
  who do little work on the engine will be expected to do more on their
  individual monster/tower code, but those who hack on the engine extensively
  are still expected to produce a non-trivial tower and monster.

* Remember that this is the challenge exercise, and that active discussion 
  is a key part of what makes these exercises interesting. But make sure you
  don't get sucked in, this problem is *much* bigger than what can reasonably be
  done in a few weeks, so just carve off a slice and be sure to leave time for
  your other assignments.


* HAVE FUN!

## QUESTIONS?

Hit up the mailing list or IRC. RMU exercises are left deliberately open ended,
and often benefit from some discussion before, during, and after you work on
them.
