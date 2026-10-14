# Project Overview :
- This project demonstrates how Generative AI and Retrieval-Augmented Generation (RAG) can be used to answer questions about the financial performance of Reliance Industries Limited using collected financial data.
- The project combines financial data analysis, text embeddings, vector similarity search, and a Large Language Model (LLM) to generate context-based answers to financial questions.

## Objectives :
- Collect and analyze company financial data.
- Build a financial knowledge base.
- Convert financial information into numerical embeddings.
- Retrieve relevant information using FAISS.
- Generate answers using Google Gemini.
- Understand the practical implementation of a RAG pipeline.

## Technologies Used :
- Python
- Jupyter Notebook
- yfinance
- Pandas
- NumPy
- Matplotlib
- Sentence Transformers
- FAISS
- Google Gemini API

## Project Workflow :
- Data Collection: Collect Reliance Industries financial data using Yahoo Finance.
- Financial Analysis: Analyze revenue, net income, EPS, balance sheet, cash flow, and financial ratios.
- Knowledge Base: Convert the collected financial information into text entries.
- Embeddings: Generate embeddings using all-MiniLM-L6-v2.
- Vector Search: Store and search embeddings using FAISS.
- Retrieval: Retrieve the most relevant information for a user's question.
- Answer Generation: Use Google Gemini to generate answers from the retrieved context.

# Example Questions :
- What was Reliance Industries' revenue in FY 2025?
- How much net income did Reliance Industries report in FY 2024?
- How did revenue change between FY 2023 and FY 2025?
- Tell me about Reliance industries revenue details
- What does the company's debt-to-equity ratio indicate?

## Key Learning Outcomes :
- Understanding the RAG architecture.
- Working with text embeddings and semantic search.
- Building a vector index using FAISS.
- Connecting an LLM through an API.
- Creating a question-answering function in Python.

## Limitations :
- The knowledge base contains a limited number of financial information entries.
- Answers depend on the relevance and accuracy of the retrieved context.
- Financial data may not represent current market conditions.
- This project is for educational purposes and does not provide investment advice.

## Future Improvements :
- Add more historical financial data.
- Support multiple companies and stock tickers.
- Improve document retrieval and answer evaluation.
- Build an interactive website for financial analysis using GenAI.
