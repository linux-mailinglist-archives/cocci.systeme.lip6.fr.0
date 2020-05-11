Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF821CD5E0
	for <lists+cocci@lfdr.de>; Mon, 11 May 2020 12:08:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04BA7bU5017610;
	Mon, 11 May 2020 12:07:37 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3D59F782B;
	Mon, 11 May 2020 12:07:37 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EFA113DC8
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 12:07:34 +0200 (CEST)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:62f])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04BA7WbW026211
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 12:07:33 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id s20so3740026plp.6
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cknHIGv2dfFrq780ViggJRx+5gYnROELhuzVTUaXGKg=;
 b=GGoPe90QiuP+bnWwrd/18p694N6fq28wV5QlIb0VmA11qdR3uSP72A4dIc2xA6E/TX
 sUdVVR8sY9E/Nio4VCYsTSMqlo8WoemTQ/k3nrHdulx5EvLzPq4P7g5gVq/Om+ZJEI5d
 yNOgRwTkMPdy6EaZ2G5V/vJLKnR+ebo/PNQRGHPxOd1zvgx/kq2eAfzvlkk43Jjgwma4
 TXvMkXBf37c3Y1w4+T6xWq+N4GUvINCwT1WKZv9t4dyXyA38YsjEUu5O/KkPbn8qx5Df
 AuEsj4DmpoNSmMGxYxzLfhtJETKPpvzMiL9l+I9LvgKyDa2oG3ojh+PSKmIJL3+V6dia
 QStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cknHIGv2dfFrq780ViggJRx+5gYnROELhuzVTUaXGKg=;
 b=WSH8p15JPsTrN8hOcRuh2fmG1TXHxqLAbihChK1zLPCuTFI2nvsz4cq+HjVdQosHqq
 ABRIx3AU9Y5HBS72fFBQ62+ChiFo5/II6vGwLdcEjUjRHznvgO8PP15ZEyaHO3/ha3xT
 QaZSoJh0hBds0KGZbS6tXQKfLwmEHin7hWIkZa2hDScBZ58MgDNWysyh7hNzAEG1Nxv+
 2FJYpCzr0ReUyO3UIA1UE/JojY5VIsXaq2Ax4JCnMKrRgyZkqxpifywg9rpMY1YEw/pB
 1tWB+rUUT8iY6kbhpgBhwdvtBMWXiPqLOxRt+ms671sfMMpHIVFyq9X0wEFwLXDF62kk
 J5dQ==
X-Gm-Message-State: AGi0Pub+K2wXjFPjVyCZzhisMbFeGTE6TOSuWzVqLrdkPMRHwlN7i52b
 D8+ZeIwVRxhZEyPIOmqoC5lpKUOyONM=
X-Google-Smtp-Source: APiQypI69WFdXqdHEuBV+4ORpe3UgKA7VxAKRiSaMaAgkjETys1n26IGVQcQfKKtajQ9+v8vjkhezg==
X-Received: by 2002:a17:902:c213:: with SMTP id
 19mr14310572pll.172.1589191651927; 
 Mon, 11 May 2020 03:07:31 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:07:31 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:43 +0530
Message-Id: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 11 May 2020 12:07:38 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 11 May 2020 12:07:34 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v2 00/32] cocci: Add cast attributes to C and SmPL
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

This patch series aims to add cast attributes to the C and SmPL ASTs, and
match them in C source code. This is a continuation of the series "cocci:
Improve C parsing of attributes"[1].

Three test cases are included:

- detect_cast_attr: Test case to detect a parameter attribute.

- remove_cast_attr: Test case to remove a parameter attribute as per the
  given SmPL.

- remove_cast_attr_allminus: Test case to replace a type in a cast and
  checking if the attribute is removed as well.

[1]https://www.mail-archive.com/cocci@systeme.lip6.fr/msg07133.html

Changes in v2:
--------------
parsing_c: parser: Pass attribute list from type_name
- Warn about dropped attributes in typeof and sizeof productions

parsing_cocci: parser: Parse cast attributes
- Mention in commit message that cast attributes are matched anywhere
  in a cast.

parsing_cocci: arity: Reflect Cast attributes
- Apply mcode2arity on attributes as well.

parsing_cocci: visitor_ast: Visit cast attributes
- Typo in commit message (AST0 -> AST).

parsing_c: pretty_print_c: Reflect Cast attributes
- Less space in front of [

parsing_c: ast_c: Add Cast attributes
- Switch places of expression and attributes in Cast type.

parsing_c: parser: Parse Cast attributes
- Switch places of expression and attributes in Cast type.

parsing_c: pretty_print_c: Reflect Cast attributes
- Switch places of expression and attributes in Cast type.
- Change printing order of cast elements.

parsing_c: type_annoter_c: Reflect Cast attributes
- Switch places of expression and attributes in Cast type.

parsing_c: visitor_c: Visit Cast attributes
- Switch places of expression and attributes in Cast type.
- Change visitor order of cast elements.

engine: cocci_vs_c: Match Cast attributes
- Switch places of expression and attributes in C AST Cast type.

ocaml: coccilib: Reflect Cast attributes
- Switch places of expression and attributes in C AST Cast type.

Jaskaran Singh (32):
      parsing_c: parser: Pass attribute list from type_name
      parsing_cocci: ast0_cocci: Add cast attributes
      parsing_cocci: parser: Parse cast attributes
      parsing_cocci: visitor_ast0: Visit cast attributes
      parsing_cocci: unparse_ast0: Reflect cast attributes
      parsing_cocci: index: Reflect Cast attributes
      parsing_cocci: iso_pattern: Reflect Cast attributes
      parsing_cocci: type_infer: Reflect Cast attributes
      parsing_cocci: arity: Reflect Cast attributes
      parsing_cocci: check_meta: Reflect Cast attributes
      parsing_cocci: compute_lines: Reflect Cast attributes
      parsing_cocci: context_neg: Reflect Cast attributes
      parsing_cocci: single_statement: Reflect Cast attributes
      parsing_cocci: ast_cocci: Add cast attributes
      parsing_cocci: visitor_ast: Visit cast attributes
      parsing_cocci: pretty_print_cocci: Print cast attributes
      parsing_cocci: ast0toast: Reflect Cast attributes
      parsing_cocci: disjdistr: Reflect Cast attributes
      parsing_cocci: unify_ast: Reflect Cast attributes
      parsing_c: ast_c: Add Cast attributes
      parsing_c: parser: Parse Cast attributes
      parsing_c: pretty_print_c: Reflect Cast attributes
      parsing_c: type_annoter_c: Reflect Cast attributes
      parsing_c: unparse_cocci: Reflect Cast attributes
      parsing_c: visitor_c: Visit Cast attributes
      engine: check_exhaustive_pattern: Reflect Cast attributes
      engine: cocci_vs_c: Match Cast attributes
      ocaml: coccilib: Reflect Cast attributes
      tools: spgen: Reflect Cast attrs
      tests: Add test case to check cast attribute allminus
      tests: Add test case to remove cast attributes
      tests: Add test case to detect cast attributes

 engine/check_exhaustive_pattern.ml       |    2 +-
 engine/cocci_vs_c.ml                     |   24 +++++++++++++++++-------
 ocaml/coccilib.mli                       |    9 +++++----
 parsing_c/ast_c.ml                       |    2 +-
 parsing_c/ast_c.mli                      |    2 +-
 parsing_c/parse_c.ml                     |    4 +++-
 parsing_c/parser_c.mly                   |   27 ++++++++++++++++++---------
 parsing_c/pretty_print_c.ml              |    7 ++++---
 parsing_c/type_annoter_c.ml              |    4 ++--
 parsing_c/unparse_cocci.ml               |    6 ++++--
 parsing_c/visitor_c.ml                   |   11 +++++++++--
 parsing_cocci/arity.ml                   |    8 +++++---
 parsing_cocci/ast0_cocci.ml              |    4 ++--
 parsing_cocci/ast0_cocci.mli             |    4 ++--
 parsing_cocci/ast0toast.ml               |    5 +++--
 parsing_cocci/ast_cocci.ml               |    4 ++--
 parsing_cocci/ast_cocci.mli              |    4 ++--
 parsing_cocci/check_meta.ml              |    3 ++-
 parsing_cocci/compute_lines.ml           |    5 +++--
 parsing_cocci/context_neg.ml             |    2 +-
 parsing_cocci/disjdistr.ml               |    5 +++--
 parsing_cocci/index.ml                   |    2 +-
 parsing_cocci/iso_pattern.ml             |   12 +++++++++---
 parsing_cocci/parser_cocci_menhir.mly    |    9 +++++----
 parsing_cocci/pretty_print_cocci.ml      |    4 +++-
 parsing_cocci/single_statement.ml        |    2 +-
 parsing_cocci/type_infer.ml              |    2 +-
 parsing_cocci/unify_ast.ml               |    6 ++++--
 parsing_cocci/unparse_ast0.ml            |    4 +++-
 parsing_cocci/visitor_ast.ml             |   10 ++++++----
 parsing_cocci/visitor_ast0.ml            |    6 ++++--
 tests/detect_cast_attr.c                 |   10 ++++++++++
 tests/detect_cast_attr.cocci             |   11 +++++++++++
 tests/detect_cast_attr.res               |   10 ++++++++++
 tests/remove_cast_attr.c                 |   10 ++++++++++
 tests/remove_cast_attr.cocci             |   10 ++++++++++
 tests/remove_cast_attr.res               |   10 ++++++++++
 tests/remove_cast_attr_allminus.c        |   10 ++++++++++
 tests/remove_cast_attr_allminus.cocci    |    9 +++++++++
 tests/remove_cast_attr_allminus.res      |   10 ++++++++++
 tools/spgen/source/position_generator.ml |    4 ++--
 41 files changed, 219 insertions(+), 74 deletions(-)



_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
