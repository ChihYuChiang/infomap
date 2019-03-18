%module infomap

%{
/* Includes the header in the wrapper code */
#include "src/core/InfomapIterator.h"
%}

%include "std_deque.i"

namespace std {
    %template(deque_uint) std::deque<unsigned int>;
}

%include "NodeBase.i"

/* Parse the header file to generate wrappers */
%include "src/core/InfomapIterator.h"


#ifdef SWIGPYTHON
%extend infomap::InfomapIterator
{

	// Make the class iterable, and wait until
	// first call to next() to yield first element
	%insert("python") %{
		def __iter__(self):
			self._firstYielded = False
			return self

		def __next__(self):
			if not self._firstYielded:
				self._firstYielded = True
			else:
				self.stepForward()

			if self.isEnd():
				raise StopIteration

			return self
		
		@property
		def id(self):
			"""Get the 'stateId' property."""
			return self.stateId
	%}
}

%extend infomap::InfomapLeafModuleIterator
{

	// Make the class iterable, and wait until
	// first call to next() to yield first element
	%insert("python") %{
		def __iter__(self):
			self._firstYielded = False
			return self

		def __next__(self):
			if not self._firstYielded:
				self._firstYielded = True
			else:
				self.stepForward()

			if self.isEnd():
				raise StopIteration

			return self
		
		@property
		def id(self):
			"""Get the 'stateId' property."""
			return self.stateId
	%}
}

%extend infomap::InfomapLeafIterator
{

	// Make the class iterable, and wait until
	// first call to next() to yield first element
	%insert("python") %{
		def __iter__(self):
			self._firstYielded = False
			return self

		def __next__(self):
			if not self._firstYielded:
				self._firstYielded = True
			else:
				self.stepForward()

			if self.isEnd():
				raise StopIteration

			return self
		
		@property
		def id(self):
			"""Get the 'stateId' property."""
			return self.stateId
	%}
}

%extend infomap::InfomapIteratorPhysical
{

	// Make the class iterable, and wait until
	// first call to next() to yield first element
	%insert("python") %{
		def __iter__(self):
			self._firstYielded = False
			return self

		def __next__(self):
			if not self._firstYielded:
				self._firstYielded = True
			else:
				self.stepForward()

			if self.isEnd():
				raise StopIteration

			return self
		
		@property
		def id(self):
			"""Get the 'stateId' property."""
			return self.stateId
	%}
}

%extend infomap::InfomapLeafIteratorPhysical
{

	// Make the class iterable, and wait until
	// first call to next() to yield first element
	%insert("python") %{
		def __iter__(self):
			self._firstYielded = False
			return self

		def __next__(self):
			if not self._firstYielded:
				self._firstYielded = True
			else:
				self.stepForward()

			if self.isEnd():
				raise StopIteration

			return self
		
		@property
		def id(self):
			"""Get the 'stateId' property."""
			return self.stateId
	%}
}
#endif