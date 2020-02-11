Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7937159152
	for <lists+cocci@lfdr.de>; Tue, 11 Feb 2020 15:02:31 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 01BE1tsh015932;
	Tue, 11 Feb 2020 15:01:55 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3579D7801;
	Tue, 11 Feb 2020 15:01:55 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B25EB77EF
 for <cocci@systeme.lip6.fr>; Tue, 11 Feb 2020 15:01:52 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:443])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 01BE1oPm000352
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 11 Feb 2020 15:01:51 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id n7so5562498pfn.0
 for <cocci@systeme.lip6.fr>; Tue, 11 Feb 2020 06:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S1++7kP6tXDKBd34NXZh/jrm4XImjEMB0GxCEH/3wBU=;
 b=acvYgbSdKsbxXiAamIo24G7YR39D/eTfJrVvRPU414RqjG5m11zdEDz/LzZ3kaDdK5
 U1RE+Rd8mG/KpR363XWKtIrKWSD8iNmmMm6e1Pgirp7yctsMrc9MwxyAemS4vMzV/WfQ
 Ai1IQHsT9jtyxIvd7I9fY+cIaRqwfWHJyqI1Hqj+l5Zn5+esUbUrvuBpxgLmSes8k7qA
 bBT5mveJWf5plUa0TJmwi+/xzTXNAawKjGojuvKQt6HJpXUBNfUiAnTdW54hN9Qm7JA1
 0ed13uc1Ej+kIVR/1IIVhg9PeZkcnGPaW0pZth8Rb/05iqg0OTzZJunCiSr2NSY+HDd5
 5QgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S1++7kP6tXDKBd34NXZh/jrm4XImjEMB0GxCEH/3wBU=;
 b=Gz+2mSgBxJDFL9QqyAnLNm1rFET5b9IV6RP8goNbC13leMqvWa69bWt2ueCb2I2+eb
 vqQ3ECtHepjWUNwBtMIHtQnuri/KcZ1N9C65kSe/mxVE3XXmB9EYFeQ0brsX3avpNNmi
 Z+RGS+qQOodzHxvJJDk7kKyIyaMEAJMfPQ8wpGiELRCDikb1E4XEvxaBD3DVjR3Hc1Q2
 UuwPMTR8NTudlpCjwCn6SXVcFPejuWWVOblfTwMxlsVrptLGw3WVdwK3Z7EZKSE1kmbd
 yUlkWchqe8ZiIrv3q1UgfFMXSD5XbP2d3mCfZf2aDJPw4Ui/bvTFDXDPXFGVyeJqrqN7
 U6ww==
X-Gm-Message-State: APjAAAWKU6Q2syc75qa9BEClPQvSEvW9Y98my61Lu8uwRRBxuQv0nj5C
 yBqJnbx27V5CjJv7l6itL+QMNYZt
X-Google-Smtp-Source: APXvYqxdPTd1uTFRCdsF1L5Ty2PH1WiVF0BIxPvLjlM4agf51abg0KACwcUMPZSPEQ7/d30HxIl3Jw==
X-Received: by 2002:aa7:96b6:: with SMTP id g22mr6617712pfk.206.1581429707966; 
 Tue, 11 Feb 2020 06:01:47 -0800 (PST)
Received: from localhost.localdomain ([2405:204:22ac:7250:d1c8:6411:2f12:731d])
 by smtp.gmail.com with ESMTPSA id z26sm4203575pgu.80.2020.02.11.06.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 06:01:47 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 11 Feb 2020 19:31:34 +0530
Message-Id: <20200211140137.2304-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 11 Feb 2020 15:01:56 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 11 Feb 2020 15:01:52 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v5 0/3] cocci: Align the C AST and Cocci AST for
	pointer
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

This series is to address the type matching problem in Coccinelle.

Patch 1/3 is for aligning the C and Cocci AST so that
pointer to const pointer and its variants can be matched.

Patch 2/3 reflects the pretty printing changes made in 
1/3 in the ptrconstptr test case. A space is added between
the * and const.

Patch 3/3 consists of a test case for matching a pointer to
const pointer and its variants.

Changes in v5:
--------------
- Remove unnecessary parantheses and return of unit in Patch 1/3.
- Have the test case in Patch 3/3 conform more closely with the
  Linux kernel coding style.

Changes in v4:
--------------
- Fix coding style w/r/t placement of comment with List.iter and
  the qualifier printing function.

Changes in v3:
--------------
- Add a space between the * and qualifier in Patch 1/3.
- Add Patch 2/3 to add a space between * and const in the test
  case ptrconstptr.

Changes in v2:
--------------
- Change body and subject of Patch 2/2 as per suggestion of Markus
  Elfring.

[PATCH v5 1/3] parsing_c: Align C AST and Cocci AST for pointer
[PATCH v5 2/3] tests: Add space between * and const in
[PATCH v5 3/3] tests: Add test case to match const pointer variants

 parsing_c/parser_c.mly      |    4 ++--
 parsing_c/pretty_print_c.ml |   15 ++++++++++-----
 tests/constptr.c            |    7 +++++++
 tests/constptr.cocci        |   19 +++++++++++++++++++
 tests/constptr.res          |    7 +++++++
 tests/ptrconstptr.res       |    2 +-
 6 files changed, 46 insertions(+), 8 deletions(-)

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
