Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1413C6D65
	for <lists+cocci@lfdr.de>; Tue, 13 Jul 2021 11:29:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 16D9SYAM020319;
	Tue, 13 Jul 2021 11:28:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7E14F77F5;
	Tue, 13 Jul 2021 11:28:34 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6C5563F5A
 for <cocci@systeme.lip6.fr>; Tue, 13 Jul 2021 11:28:32 +0200 (CEST)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1036])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 16D9SRef005167
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 13 Jul 2021 11:28:29 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 o3-20020a17090a6783b0290173ce472b8aso1050729pjj.2
 for <cocci@systeme.lip6.fr>; Tue, 13 Jul 2021 02:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=hBQro6vTSAuBkw+D0DIxLsWtqvb8ajK8f9Gtyg6WpuE=;
 b=qKY1gbKQgEcWOjrgpZgK5EMbHnF2CBRfiUNbXPa2s0ekF8PjDyYRAvHBqwOCuurpzN
 K+jsOhvctyfxcPHICmmvQsgGPsH+kuZd3jn8ggDAoJpbZdkKO/DFT2bohzedJAhbrfqW
 0t/Zth6rcipkL1WdLxCvDDjkKdTpZxvvb+yrbX6P4TAxWniEiBQerTjoLvEFQ2i4F5nh
 BRWz1+wcFVkZOaiGel174ft62A0ux9MeVkp8JHFqQMGBJRpDOAQzlsTyJYcF9v6PGa/z
 x/HZ70D/jm9pmpXm5lBYLVMm7Vl0JeErATVof+UFNLn5vBIhFqzOkvfXf7tRiYo37NAT
 1fxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=hBQro6vTSAuBkw+D0DIxLsWtqvb8ajK8f9Gtyg6WpuE=;
 b=q52S9nEQq0mq7ItFMpOXqChD9YC5EZv0NgPILL905P4yTFoYNQCI9C1LdQqB1MTZ99
 MiTwwtB7hsB2Z2UC/VmK7UD5aX0+hIiniW50JYDsLQoIZYb13QabeXoUKWxxf/CPPCLA
 hEshkWYvVLlm+Qjnveb71p13ELV8ER4TJAHPlGMqDGFoR5qwPvSpW42zOSkEQKB1I1rm
 1V8fZlp8zqXQpgZ+MqjnpFh8alIW7QAC7JID0tCN8aWoPKnJm8fmbSJIrJo6oTJnTrKB
 u+holkXqswh5X4OOL5wuPPjIWANCFfAX9xh7IjXIb2rCQh8S2lTTOjYJLRbnIMl/loIO
 sPZA==
X-Gm-Message-State: AOAM532Awpj4Wv+NhmgC0B7wbVIvvw90rZ0rYtYGRSArVVtu0Q0w4fp7
 1fy8O3BZnS0nR/FoMKAI+9U=
X-Google-Smtp-Source: ABdhPJwYC4NfjD0c2OFj9QbGFvn/wmqSG/44Fi9Kh1XQ2IRng88X9+odroyGhX7xA9fdfJtS3ZQqEg==
X-Received: by 2002:a17:90b:3608:: with SMTP id
 ml8mr18685876pjb.215.1626168507340; 
 Tue, 13 Jul 2021 02:28:27 -0700 (PDT)
Received: from adolin ([49.207.196.203])
 by smtp.gmail.com with ESMTPSA id c14sm20434199pgv.86.2021.07.13.02.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:28:26 -0700 (PDT)
Date: Tue, 13 Jul 2021 14:57:28 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: julia.lawall@inria.fr
Message-ID: <cover.1626167690.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 13 Jul 2021 11:28:36 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 13 Jul 2021 11:28:29 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH V2 0/2] Add "use-patch-diff" option
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

This patchset adds a feature to enable Coccinelle
to only check all those files in a directory which were
modified. It parses all the files obtained from the
output of "git diff" and checks them against the specified
cocci script.

An example for passing the "use-patchdiff" option is:

	spatch -D report --sp-file for_each_child.cocci --use-patchdiff drivers/gpu

One thing to note while using the command is that while it can be
invoked outside the target project directory, an absolute path
to the target folder should be specified in such cases.

Sumera Priyadarsini (2):
  parsing_cocci: Add feature to check only modified files
  docs: manual: Add option description in spatch_options

 Makefile                        |   2 +-
 docs/manual/spatch_options.tex  |   5 ++
 enter.ml                        |  17 +++--
 globals/flag.ml                 |   2 +-
 globals/flag.mli                |   2 +-
 ocaml/coccilib.mli              |   1 +
 parsing_cocci/get_constants2.ml |   1 +
 parsing_cocci/patch_diff.ml     | 118 ++++++++++++++++++++++++++++++++
 parsing_cocci/patch_diff.mli    |   9 +++
 9 files changed, 148 insertions(+), 9 deletions(-)
 create mode 100755 parsing_cocci/patch_diff.ml
 create mode 100644 parsing_cocci/patch_diff.mli

-- 
2.32.0

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
