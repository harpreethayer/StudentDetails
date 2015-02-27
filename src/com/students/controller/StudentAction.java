package com.students.controller;

import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.*;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.mongodb.DBCollection;
import com.students.model.StudentForm;
import com.students.model.StudentModel;

public class StudentAction extends DispatchAction {

	String result = "failure";
	StudentModel studentModel = new StudentModel();

	public ActionForward createStudent(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		StudentForm formBean = (StudentForm) form;
		result = studentModel.createStudent(formBean.getStudentnumber(),
				formBean.getGender(), formBean.getBirthdate(), formBean
						.getDisability(), formBean.getFirstname(), formBean
						.getLastname(), formBean.getEmail());
		if (result.equalsIgnoreCase("success")) {
			result = "created";
		}
		return mapping.findForward(result);
	}

	public ActionForward showStudents(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		DBCollection coll = studentModel.showStudents();
		if (coll != null) {
			request.setAttribute("coll", coll);
			result = "success";
		}
		return mapping.findForward(result);
	}

	public ActionForward deleteStudent(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String obj_Id = request.getParameter("obj_Id");

		result = studentModel.deleteStudent(obj_Id);
		if (result.equalsIgnoreCase("success")) {
			result = "created";
		}
		return mapping.findForward(result);
	}

	public ActionForward editStudent(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String obj_Id = request.getParameter("objIdEdit");
		String dataField = "";
		Collection resultValues = studentModel.editStudent(obj_Id);
		if (resultValues != null) {
			Iterator itr = resultValues.iterator();
			while (itr.hasNext()) {
				dataField = dataField + itr.next() + "^";
			}
			result = "editPage";
			request.setAttribute("dataField", dataField);
		}
		return mapping.findForward(result);
	}

	public ActionForward updateStudent(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		StudentForm formBean = (StudentForm) form;
		result = studentModel.updateStudent(formBean.getObjId(), formBean
				.getStudentnumber(), formBean.getGender(), formBean
				.getBirthdate(), formBean.getDisability(), formBean
				.getFirstname(), formBean.getLastname(), formBean.getEmail());
		if (result.equalsIgnoreCase("success")) {
			result = "created";
		}
		return mapping.findForward(result);
	}
}
