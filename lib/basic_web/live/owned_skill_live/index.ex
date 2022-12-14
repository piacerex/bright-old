defmodule BasicWeb.OwnedSkillLive.Index do
  use BasicWeb, :live_view

  alias Basic.OwnedSkills
  alias Basic.OwnedSkills.OwnedSkill

  @impl true
  def mount(_params, _session, socket) do
#    {:ok, assign(socket, :owned_skills, list_owned_skills())}

    {:ok,
      socket
      |> assign(:owned_skills, list_owned_skills())
      |> assign(:owned_mark, 0)
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
#    |> assign(:page_title, "Edit Owned skill")
    |> assign(:page_title, "保有スキル編集")
    |> assign(:owned_skill, OwnedSkills.get_owned_skill!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
#    |> assign(:page_title, "New Owned skill")
    |> assign(:page_title, "保有スキル新規登録")
    |> assign(:owned_skill, %OwnedSkill{})
  end

  defp apply_action(socket, :index, _params) do
    socket
#    |> assign(:page_title, "Listing Owned skills")
    |> assign(:page_title, "保有スキル一覧")
    |> assign(:owned_skill, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    owned_skill = OwnedSkills.get_owned_skill!(id)
    {:ok, _} = OwnedSkills.delete_owned_skill(owned_skill)

    {:noreply, assign(socket, :owned_skills, list_owned_skills())}
  end

  defp list_owned_skills do
    OwnedSkills.list_owned_skills()
  end

# ADD START
  @impl true
  def handle_event("validate", params, socket) do
    {:noreply, assign(socket, :owned_skills, list_owned_skills())}
  end

  def handle_event("save", params, socket) do
    save_owned_skills(socket, params)
  end

  defp save_owned_skills(socket, owned_skills_params) do
    Enum.map(0..length(owned_skills_params["edit"]["id"])-1, fn(n) ->                  
      case OwnedSkills.update_owned_skill(Enum.at(socket.assigns.owned_skills, n),
                                          %{} |> Map.put("id", Enum.at(owned_skills_params["edit"]["id"], n))
                                              |> Map.put("account_id", Enum.at(owned_skills_params["edit"]["account_id"], n))
                                              |> Map.put("evidence_text", Enum.at(owned_skills_params["edit"]["evidence_text"], n))
                                              |> Map.put("evidence_url", Enum.at(owned_skills_params["edit"]["evidence_url"], n))
                                              |> Map.put("exam_count", Enum.at(owned_skills_params["edit"]["exam_count"], n))
                                              |> Map.put("exam_limit", Enum.at(owned_skills_params["edit"]["exam_limit"], 3*n)
                                                                       |> Map.merge(Enum.at(owned_skills_params["edit"]["exam_limit"], 3*n+1))
                                                                       |> Map.merge(Enum.at(owned_skills_params["edit"]["exam_limit"], 3*n+2)))
                                              |> Map.put("exam_score", Enum.at(owned_skills_params["edit"]["exam_score"], n))
                                              |> Map.put("learned_progress", Enum.at(owned_skills_params["edit"]["learned_progress"], n))
                                              |> Map.put("learning_limit", Enum.at(owned_skills_params["edit"]["learning_limit"], 3*n)
                                                                           |> Map.merge(Enum.at(owned_skills_params["edit"]["learning_limit"], 3*n+1))
                                                                           |> Map.merge(Enum.at(owned_skills_params["edit"]["learning_limit"], 3*n+2)))
                                              |> Map.put("mark", Enum.at(owned_skills_params["edit"]["mark"], n))
                                              |> Map.put("skill_id", Enum.at(owned_skills_params["edit"]["skill_id"], n))
                                         ) do
        {:ok, _owned_skill} ->
          {:noreply, socket}

        {:error, %Ecto.Changeset{} = changeset} ->
          {:noreply, assign(socket, :owned_skills, list_owned_skills())}
      end
    end)

    {:noreply,
    socket
    |> put_flash(:info, "編集できました")
    |> assign(:owned_skills, list_owned_skills())}
  end
# ADD END
end
