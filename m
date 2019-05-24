Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74229EE7
	for <lists+cocci@lfdr.de>; Fri, 24 May 2019 21:14:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4OJEMsB022987;
	Fri, 24 May 2019 21:14:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8E647775D;
	Fri, 24 May 2019 21:14:22 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7AE777747
 for <cocci@systeme.lip6.fr>; Fri, 24 May 2019 21:14:20 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4OJEJw2009963
 for <cocci@systeme.lip6.fr>; Fri, 24 May 2019 21:14:20 +0200 (CEST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 331D32175B
 for <cocci@systeme.lip6.fr>; Fri, 24 May 2019 19:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558725259;
 bh=oZYSoU7rYHG6+EWSQJRSgjh1b0dv/XLFBpazMJaAXsM=;
 h=From:Date:Subject:To:From;
 b=zM8pF/iHtqnd5TTbki72ihdoSVLJ/n08H9grsBLfKbEHzJUUNXl72Cxf01jz7xYg4
 ihKN3qvG6o8bQdmPXFkKbwdVWHSGjzlEpRWiO+Ctk7xuPBB4/2Y1v7uPpMDCGboBf/
 0tOBLEUktAxX9SUk8YeCPnO8K9MyvLupXfzKZCkE=
Received: by mail-ot1-f53.google.com with SMTP id l17so9695401otq.1
 for <cocci@systeme.lip6.fr>; Fri, 24 May 2019 12:14:19 -0700 (PDT)
X-Gm-Message-State: APjAAAV+dRW46MIuuiqGLhhOkEoHO96zgLiRLKLZErqn0+xkK3S/NKGD
 Bg+lLUfldOOqVIw5xm4DpB3iG6R7bT23NhWMKTI=
X-Google-Smtp-Source: APXvYqwmsn8vDewgtG9rHWN6GpQnGVPkVQQdKd2Z2NhD8NCAyKBeaMMatoj+3llGDhcZnlPDVdfLX5oN2AtXRTODzyM=
X-Received: by 2002:a9d:5c19:: with SMTP id o25mr33784441otk.176.1558725258608; 
 Fri, 24 May 2019 12:14:18 -0700 (PDT)
MIME-Version: 1.0
From: Timur Tabi <timur@kernel.org>
Date: Fri, 24 May 2019 14:13:42 -0500
X-Gmail-Original-Message-ID: <CAOZdJXWVyC3o6vVbNEakhr8p4vX4j3wkkSyJg77-hcQ7Nqhf=g@mail.gmail.com>
Message-ID: <CAOZdJXWVyC3o6vVbNEakhr8p4vX4j3wkkSyJg77-hcQ7Nqhf=g@mail.gmail.com>
To: cocci <cocci@systeme.lip6.fr>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 24 May 2019 21:14:23 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 24 May 2019 21:14:20 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] How to concatenate identifier with text?
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

@@
identifier func;
@@
func(...) {
<+...
     .... stuff
+   goto func_exit;
+}
...+>
}

So if I have this code:

void myfunc(int x)
{
}

I want it to look like this:

void myfunc(int x)
{
    goto myfunc_exit;
}

My problem is that cocci takes "func_exit" literally.  I tried
func##_exit, but that didn't work.  How do I make this work?
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
