import React, { useEffect, useRef } from "react";
import PropTypes from "prop-types";
import { IoIosClose } from "react-icons/io";
import styled, { css } from "styled-components";

const Overlay = styled.div`
  align-items: center;
  background: rgba(0, 0, 0, 0.4);
  display: flex;
  height: 100%;
  justify-content: center;
  left: 0;
  opacity: 0;
  position: fixed;
  visibility: hidden;
  top: 0;
  transition: all 0.2s ease-in-out;
  width: 100%;

  ${props =>
    props.visible &&
    css`
      opacity: 1;
      visibility: visible;
    `}
`;

const Wrapper = styled.div`
  background: var(--white);
  border-radius: 5px;
  box-shadow: 0 3px 32px 0 rgba(10, 31, 68, 0.1),
    0 0 1px 0 rgba(10, 31, 68, 0.08);
  opacity: 0;
  padding: 16px;
  position: relative;
  transform: translateY(-25px);
  transition: all 0.2s ease;
  transition-delay: 0.2s;
  min-width: 350px;

  ${props =>
    props.visible &&
    css`
      opacity: 1;
      transform: translateY(0);
    `}
`;

const ModalCloser = styled.button`
  background: none;
  border: none;
  font-size: 28px;
  margin: 6px 2px;
  position: absolute;
  right: 0;
  top: 0;
`;

const ModalBody = styled.div`
  form div {
    margin-bottom: 12px;

    &:last-child {
      margin-bottom: 0;
    }
  }

  label {
    color: var(--softerBlack);
    display: block;
    font-size: 0.85em;
    margin-bottom: 4px;
  }

  input,
  textarea,
  select {
    border: solid 1px var(--darkerGrey);
    border-radius: 3px;
    font-family: inherit;
    color: var(--black);
    padding: 12px;
    width: 100%;
  }

  form button {
    background: var(--blue);
    border: solid 1px var(--blue);
    border-radius: 3px;
    color: var(--shaded-white);
    cursor: pointer;
    height: 32px;
    padding: 0 16px;
    transition: all 0.2s ease-in-out;
  }
`;

const ModalTodo = ({ visible, title, onSubmit, onCancel, ...props }) => {
  const overlay = useRef(null);
  const form = useRef(null);

  useEffect(() => {
    overlay.current.addEventListener("click", handleOutsideClick);

    // clean up function on update
    return () =>
      overlay.current.removeEventListener("click", handleOutsideClick);
  }, []);

  const handleCloseModal = () => {
    onCancel();
  };

  const handleOutsideClick = e => {
    if (e.target === overlay.current) {
      handleCloseModal();
    }
  };

  const handleSubmit = e => {
    e.preventDefault();
    const { title, date, priority, description } = form.current;

    const data = {
      title: title.value,
      date: date.value,
      priority: priority.value,
      description: description.value
    };

    onSubmit(data);
    form.current.reset();
  };

  return (
    <Overlay ref={overlay} visible={visible}>
      <Wrapper visible={visible}>
        <ModalCloser onClick={handleCloseModal}>
          <IoIosClose />
        </ModalCloser>
        <ModalBody>
          <h3 style={{ marginTop: "0px" }}>{title}</h3>
          <form ref={form} onSubmit={handleSubmit}>
            <div>
              <label>Title</label>
              <input name="title" placeholder="Title" required />
            </div>
            <div
              style={{
                display: "flex",
                alignItems: "flex-start",
                width: "100%"
              }}
            >
              <div style={{ marginRight: "12px" }}>
                <label>Date</label>
                <input name="date" type="date" required />
              </div>
              <div style={{ width: "100%" }}>
                <label>Priority</label>
                <select name="priority">
                  <option value="">-</option>
                  <option value="high">High</option>
                  <option value="medium">Medium</option>
                  <option value="low">Low</option>
                </select>
              </div>
            </div>
            <div>
              <label>Description</label>
              <textarea name="description" rows={4}></textarea>
            </div>
            <div style={{ display: "flex", justifyContent: "flex-end" }}>
              <button type="submit">Add Todo</button>
            </div>
          </form>
        </ModalBody>
      </Wrapper>
    </Overlay>
  );
};

ModalTodo.propTypes = {
  visible: PropTypes.bool,
  title: PropTypes.string,
  onSubmit: PropTypes.func,
  onCancel: PropTypes.func
};

ModalTodo.defaultProps = {
  visible: false,
  onSubmit: () => {},
  onCancel: () => {}
};

export default ModalTodo;
