# deconvolution-interferometry
Interferometry between 2 time series signal using deconvolution in the frequency domain.
Although the code is for the purpose of seismic interferometry, it can be applied to any time series signal/vector.

In seismic, it estimates the response recorded at receiver locations as if there is an impulse excitation at source location.
Because the impulse excitation at the source location is not physical (i.e. not an actual source), it called virtual source.
Thus the final result is called virtual source gather; an assembly of estimated traces at receiver locations.
