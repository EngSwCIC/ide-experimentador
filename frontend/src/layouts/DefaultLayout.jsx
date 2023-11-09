import { Link, Outlet } from "react-router-dom";

export function DefaultLayout() {
  return (
    <>
      {/* pode ser uma sidebar, este é só um exemplo */}
      <nav className="bg-zinc-800 text-white flex justify-between">
        <ul className="">
          <li>
            <Link className="block p-10" to={"/"}>
              Home
            </Link>
          </li>
        </ul>
        <ul className="">
          <li>
            <Link className="block p-10" to={"/login"}>
              Login
            </Link>
          </li>
        </ul>
      </nav>
      <Outlet />
    </>
  );
}
