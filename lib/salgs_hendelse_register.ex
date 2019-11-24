defmodule SalgsHendelseRegister do
  use GenServer, SalgHendelse


  @impl true
  def init(queue) do
    {:ok, queue}
  end

  def start_link()  do
    GenServer.start_link(__MODULE__, :queue.new())
  end

  def legg_til(pid, salg) do
    GenServer.cast(pid, {:legg_til, salg})
  end

  @impl true
  def handle_cast({:legg_til, salg}, queue) do
    {:noreply, :queue.in(salg, queue)}
  end

  @spec hent_ut(atom | pid | {atom, any} | {:via, atom, any}) :: any
  def hent_ut(pid) do
    GenServer.call(pid, :hent_ut)
  end


  @impl true
  def handle_call(:hent_ut, _from, queue) do
    {salg, queue}  = :queue.out(queue)
    {:reply, salg, queue}
  end


end
