import { createBrowserRouter, RouterProvider } from "react-router-dom";
import { HomePage } from "./pages";
import { DefaultLayout } from "./layouts/DefaultLayout";
import { LoginPage } from "./pages/login";

const router = createBrowserRouter([
  {
    path: "/",
    element: <DefaultLayout />,
    children: [
      {
        path: "/",
        element: <HomePage />,
      },
    ],
  },
  {
    path: "/login",
    element: <LoginPage />,
  },
]);

export function Routes() {
  return <RouterProvider router={router} />;
}
