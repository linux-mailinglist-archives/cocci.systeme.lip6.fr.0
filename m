Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E10F1E00E8
	for <lists+cocci@lfdr.de>; Sun, 24 May 2020 19:20:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04OHKAuh001787;
	Sun, 24 May 2020 19:20:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 854E57807;
	Sun, 24 May 2020 19:20:10 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7E0113D0F
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 19:20:08 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1044])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04OHK565000825
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 19:20:06 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id 5so7571375pjd.0
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 10:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9BkHP0LIJJM7RPFo+bFBjE60ncECynI2SrIbg2EUY6M=;
 b=fg6/7+EXxhw/8sjs595zptl8eraPcUp6ei0gvmR/cfzKF31fV98fOvHvfFjcmkDWJj
 lQlSObs5xBcC2r+luL3wEF3+oxfd5REf/HGkcfX7X8V8+oEWzwARa+yDsuPsYAnqcz8D
 1Gg5efTusY5TIPd50OFdY2uBjjNZnR6xP5hOnoARplV+kcxyzRdXBdimr1j7ddyLsBpH
 JWV2xDFhoVaRMBC58v5aevGwPBrQc7JTgRYdAXtQnHa3jUcSjbi9vEpzUhORxMGDU5Rs
 qHfIpAotOcsjtOUMRxjkP9xfSejHK9k5NsGzC/jm1QaBEanqv/OGdpPKhLq76GWdIdgg
 FSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9BkHP0LIJJM7RPFo+bFBjE60ncECynI2SrIbg2EUY6M=;
 b=UK2iIe70qU8579l4SiwauFjACjfQZBIwWY5M+Nrx7D8vxya4CxDyOhPrs5JBmO8bwk
 MOTZxN3BWXIOH8QHFZGewlg0A2Qjgx7UkzEgx8eadnQUdbbZQ1U3FfQLMsXedYxOL19Y
 1XDg/B3avdiQtyGHpPTMoVnOCwErRAbC0HwQAhM/k2TS2Vi6Iy4TI5YzRhOk1YczySD4
 LXwv7JWqP3I2O+NF/caIh1366XqyozErp3OEPTZcjoisZifZjH+jyxpe3L6ki//8w5bS
 NJiHPb1csyrQn5jHhqU4tKDe2PRf51ddFjjnIWeyJPd6n76rEQus0vcp9ifuNYkV+Nia
 6daQ==
X-Gm-Message-State: AOAM533/hE/u94NjAt6MFNM4YSEpRYFkGt5E1hqV6MwopJocUYjzfAoQ
 OTTav3wZQ2/36ajWHLlkSQIsjt3zfls=
X-Google-Smtp-Source: ABdhPJxfkG7yjGoGk/Ng/2kT4YfRvtCOpv4W8rbX0qffu7h12rsebwRtVD7/eBPY5nyCUQZrhU1Bng==
X-Received: by 2002:a17:902:7086:: with SMTP id
 z6mr24243104plk.294.1590340804239; 
 Sun, 24 May 2020 10:20:04 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:03 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:05 +0530
Message-Id: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 24 May 2020 19:20:13 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 24 May 2020 19:20:06 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 00/30] cocci: Add macrodecl attributes to C and SmPL
	ASTs
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

This patch series aims to add macrodecl attributes to C and SmPL ASTs,
and match them in C source code. This is a continuation of the series
"cocci: Improve C parsing of attributes"[1].

Two test cases are included:

- detect_macrodecl_attr: Test case to detect a macrodecl attribute.

- remove_macrodecl_attr: Test case to remove a macrodecl attribute as per the
  given SmPL.

[1]https://www.mail-archive.com/cocci@systeme.lip6.fr/msg07133.html

Jaskaran Singh (30):
      parsing_cocci: ast0_cocci: Add Macrodecl attributes
      parsing_cocci: parser: Parse Macrodecl attributes
      parsing_cocci: visitor_ast0: Visit Macrodecl attributes
      parsing_cocci: unparse_ast0: Reflect Macrodecl attributes
      parsing_cocci: index: Reflect Macrodecl attributes
      parsing_cocci: iso_pattern: Reflect Macrodecl attributes
      parsing_cocci: type_infer: Reflect Macrodecl attributes
      parsing_cocci: arity: Reflect Macrodecl attributes
      parsing_cocci: check_meta: Reflect Macrodecl attributes
      parsing_cocci: compute_lines: Reflect Macrodecl attributes
      parsing_cocci: context_neg: Reflect Macrodecl attributes
      parsing_cocci: single_statement: Reflect Macrodecl attributes
      parsing_cocci: ast_cocci: Reflect Macrodecl attributes
      parsing_cocci: visitor_ast: Reflect Macrodecl attributes
      parsing_cocci: pretty_print_cocci: Reflect Macrodecl attributes
      parsing_cocci: disjdistr: Reflect Macrodecl attributes
      parsing_cocci: adjust_pragmas: Reflect Macrodecl attributes
      parsing_cocci: unify_ast: Reflect Macrodecl attributes
      parsing_cocci: ast0toast: Reflect Macrodecl attributes
      parsing_c: ast_c: Add Macrodecl attributes
      parsing_c: parser_c: Reflect Macrodecl attributes
      parsing_c: visitor_c: Reflect Macrodecl attributes
      parsing_c: pretty_print_c: Reflect Macrodecl attributes
      parsing_c: unparse_cocci: Reflect Macrodecl attributes
      engine: check_exhaustive_pattern: Reflect Macrodecl attributes
      engine: cocci_vs_c: Match Macrodecl attributes
      ocaml: coccilib: Reflect Macrodecl attributes
      tools: spgen: Reflect Macrodecl attributes
      tests: Add test case to remove macrodecl attributes
      tests: Add test case to detect a macrodecl attribute

 engine/check_exhaustive_pattern.ml       |    4 ++--
 engine/cocci_vs_c.ml                     |   23 +++++++++++++----------
 ocaml/coccilib.mli                       |    8 +++++---
 parsing_c/ast_c.ml                       |    3 ++-
 parsing_c/ast_c.mli                      |    4 +++-
 parsing_c/parser_c.mly                   |   23 ++++++++++++++++-------
 parsing_c/pretty_print_c.ml              |    7 ++++---
 parsing_c/unparse_cocci.ml               |    7 +++++--
 parsing_c/visitor_c.ml                   |    6 ++++--
 parsing_cocci/adjust_pragmas.ml          |   12 ++++++------
 parsing_cocci/arity.ml                   |    5 +++--
 parsing_cocci/ast0_cocci.ml              |    3 ++-
 parsing_cocci/ast0_cocci.mli             |    3 ++-
 parsing_cocci/ast0toast.ml               |    5 +++--
 parsing_cocci/ast_cocci.ml               |    3 ++-
 parsing_cocci/ast_cocci.mli              |    3 ++-
 parsing_cocci/check_meta.ml              |    3 ++-
 parsing_cocci/compute_lines.ml           |    7 ++++---
 parsing_cocci/context_neg.ml             |    6 +++---
 parsing_cocci/disjdistr.ml               |    4 ++--
 parsing_cocci/index.ml                   |    2 +-
 parsing_cocci/iso_pattern.ml             |    9 ++++++---
 parsing_cocci/parser_cocci_menhir.mly    |    8 ++++----
 parsing_cocci/pretty_print_cocci.ml      |    7 +++++--
 parsing_cocci/single_statement.ml        |    6 +++---
 parsing_cocci/type_infer.ml              |    2 +-
 parsing_cocci/unify_ast.ml               |    4 ++--
 parsing_cocci/unparse_ast0.ml            |    7 +++++--
 parsing_cocci/visitor_ast.ml             |   10 ++++++----
 parsing_cocci/visitor_ast0.ml            |    7 ++++---
 tests/detect_macrodecl_attr.c            |    5 +++++
 tests/detect_macrodecl_attr.cocci        |   12 ++++++++++++
 tests/detect_macrodecl_attr.res          |    5 +++++
 tests/remove_macrodecl_attr.c            |    3 +++
 tests/remove_macrodecl_attr.cocci        |    8 ++++++++
 tests/remove_macrodecl_attr.res          |    3 +++
 tools/spgen/source/meta_variable.ml      |    2 +-
 tools/spgen/source/position_generator.ml |    4 ++--
 38 files changed, 161 insertions(+), 82 deletions(-)


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
