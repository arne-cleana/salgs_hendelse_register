defmodule SalgsHendelseRegisterTest do
  use ExUnit.Case
  doctest SalgsHendelseRegister

  test "skal hente ut 4 salgshendelser" do
    {_, pid} = SalgsHendelseRegister.start_link()


    SalgsHendelseRegister.legg_til(pid, %SalgHendelse{id: 1, payload: "salg 1"})
    SalgsHendelseRegister.legg_til(pid, %SalgHendelse{id: 2, payload: "salg 2"})
    SalgsHendelseRegister.legg_til(pid, %SalgHendelse{id: 3, payload: "salg 3"})
    SalgsHendelseRegister.legg_til(pid, %SalgHendelse{id: 4, payload: "salg 4"})

    {_, svar1} = SalgsHendelseRegister.hent_ut(pid)
    {_, svar2} = SalgsHendelseRegister.hent_ut(pid)
    {_, svar3} = SalgsHendelseRegister.hent_ut(pid)
    {_, svar4} = SalgsHendelseRegister.hent_ut(pid)

    assert svar1.id == 1
    assert svar2.id == 2
    assert svar3.id == 3
    assert svar4.id == 4
  end

end
