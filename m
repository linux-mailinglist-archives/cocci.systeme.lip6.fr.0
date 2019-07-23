Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5C971C5E
	for <lists+cocci@lfdr.de>; Tue, 23 Jul 2019 18:00:39 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6NG0Be4022491;
	Tue, 23 Jul 2019 18:00:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6C4027791;
	Tue, 23 Jul 2019 18:00:11 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E3F0D76BF
 for <cocci@systeme.lip6.fr>; Tue, 23 Jul 2019 18:00:08 +0200 (CEST)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:32d] (may be forged))
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6NG08Dm016864
 for <cocci@systeme.lip6.fr>; Tue, 23 Jul 2019 18:00:08 +0200 (CEST)
Received: by mail-ot1-x32d.google.com with SMTP id d17so44591647oth.5
 for <cocci@systeme.lip6.fr>; Tue, 23 Jul 2019 09:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=E5EkzpkDJGF3gu/CHElt13ntpBFB2xq4uoBw6H2DbE8=;
 b=QE2YF1ubgdFK9ysvMZlq+kX2tnObnDriPQFzP/s0diM8IPTQ8eJFSf3PA25h8PHX0E
 UUoNe7LfYoRR8PmJu4Lqen0O90rTDimTlUEpqx9m1v1GoNyGPQ1DuJxl9O8n40D88hBs
 t9A3jfUUXVGaVK/s6b3ZBclvSDloJfQZclmqxPstPwkXZjNNbZSUxmZu7MX+OBC4IYwT
 H2ezrSdgEncNqSaxqH3Se7dvewxgYYHqB8MQj+E/8P2cQt0mPWI+Cnb3zYJc2sKbnjy+
 xIfhobPYgNB7G8KCeObZcVoplolpBZwFMFyalj+HXITaBMm99lVEtnFruY+25z3ZwNev
 WPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=E5EkzpkDJGF3gu/CHElt13ntpBFB2xq4uoBw6H2DbE8=;
 b=Fl8vsdeCOiXRNyYtc1sGo+u3wjb4rXb1P63ojdxfzAYxld5a7y6RiahV2GdVbIWwtl
 p+MsvUwW0HazVYVgv3aoctem7fTo9+EqTSgYOvgNJiL3yT/9FUl5cKfD4sen50/Ml26X
 +vDKNmnBdKqBMz/7K5GmdXABi9f+tRxGCKUEtPytuY7mepgJ3dS84xIUZrKMBUAX9sT9
 PGW4LHe2H57MRzb9aEeUjkfjSCzPUoobGD/vS4P287nqGG1CqHxwH7xsWdm7jv2ilLfg
 wmxL+wd6qCY+XxhHEPG4zog0kCRAA0aaIUF76eDi1sGid+S+6heZPLBlatcOb2hGE/Vh
 SnkA==
X-Gm-Message-State: APjAAAXxwiayhc2hZiCKiWTurM3kQVdBlP1eiCxmOTBLvN/bcrjt9vSJ
 kmhgVCLex4i1Ig+e1rxtsJOOgfZRZO1l2+vD88aOpdW/
X-Google-Smtp-Source: APXvYqylmWDc6UONFQVojzCIUDX0TPrltw7TZiEEQz2aCqeOmY8r9bJPOsyBJkYM2rlzWH0pZ/izP+gUmTeTAnHO24M=
X-Received: by 2002:a9d:4103:: with SMTP id o3mr47761776ote.134.1563897607381; 
 Tue, 23 Jul 2019 09:00:07 -0700 (PDT)
MIME-Version: 1.0
From: ron minnich <rminnich@gmail.com>
Date: Tue, 23 Jul 2019 08:59:56 -0700
Message-ID: <CAP6exY+zaafb6os8X5uhteVMgyu2+HVL5keOs-yFWOF-QRuLrQ@mail.gmail.com>
To: cocci@systeme.lip6.fr
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 23 Jul 2019 18:00:14 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 23 Jul 2019 18:00:08 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] force usage of stdbool in C programs
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

I apologize if this has been asked.

In the coreboot project, due to its long history, we have lots of
conditionals and such with old school ints as conditional, and the
question was raised about fixing this.

Has this been done with spatch and is there an example I can loo for?

thanks

ron
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
