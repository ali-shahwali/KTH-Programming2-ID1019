defmodule Complex do
  @typedoc """
    complex number representation
    """

    @type real :: float()
    @type imag :: float()
    @type complex :: {:complex, real, imag}

    @doc """
    Returns new complex number
    """

    @spec new(real, imag) :: complex()

    def new(real, imag) do {:complex, real, imag} end

    @doc """
    Returns the sum of two complex numbers
    """

    @spec add(complex, complex) :: complex()

    def add({:complex, r1, i1}, {:complex, r2, i2}) do
      {:complex, r1 + r2, i1 + i2}
    end

    @doc """
    Returns the square of a complex number
    """

    @spec sqr(complex) :: complex()

    def sqr({:complex, real, imag}) do
      {:complex, real*real - imag*imag, 2*real*imag}
    end

    @doc """
    Returns the absolute value of a complex number
    """

    @spec abs(complex) :: real()

    def abs({:complex, real, imag}) do
      :math.sqrt(real*real + imag*imag)
    end
end
