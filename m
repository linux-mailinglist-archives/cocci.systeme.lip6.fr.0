Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 188E51EB96F
	for <lists+cocci@lfdr.de>; Tue,  2 Jun 2020 12:20:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 052AJrO7000087;
	Tue, 2 Jun 2020 12:19:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1C87A7828;
	Tue,  2 Jun 2020 12:19:53 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 982AA3F9A
 for <cocci@systeme.lip6.fr>; Tue,  2 Jun 2020 12:19:51 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 052AJo0t026976
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 2 Jun 2020 12:19:51 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,463,1583190000"; d="scan'208";a="452506353"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 12:19:50 +0200
Date: Tue, 2 Jun 2020 12:19:50 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Paul Chaignon <paul@cilium.io>
In-Reply-To: <20200602092802.GA24095@Mem>
Message-ID: <alpine.DEB.2.21.2006021214430.4634@hadrien>
References: <20200602092802.GA24095@Mem>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 02 Jun 2020 12:19:53 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 02 Jun 2020 12:19:51 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Whitelist function in rule
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



On Tue, 2 Jun 2020, Paul Chaignon wrote:

> Hi all,
>
> I'm trying to find calls to ep_tail_call() that are *not* followed by
> 'return DROP_MISSED_TAIL_CALL'. That works fine (rule1 below), but I then
> want to whitelist one specific function, send_drop_notify().
>
> I couldn't find a way to do that from the first rule, so I whitelisted
> send_drop_notify() with a second rule (rule2 below). That seems rather
> cumbersome and I'm wondering if there's maybe a simpler approach?
>
>   @rule1@
>   position p1;

In coccinelle/tests/python_poscon.cocci you have an example of how to
attach python code to a metavariable:

@initialize:python@
@@

def past_line_4(p, other):
    return int(p[0].line) > 4

@r@
expression e;
@@

f(e)

@@
position p : script:python(r.e) { past_line_4(p, e) };
expression r.e;
@@

g(
-e@p
+27
 )

In your case, I think that in the python code you should be able to access
p1[0].current_element.  You can check that that is different than the
name of the function that you want to ignore.  There are some limitations
on what can be put in the {} in such a metavariable declaration, so if you
have problems you can make a function, as shown in the example.  That code
should return true if you want the match to take place and false
otherwise.

julia



>   @@
>
>   (
>     ep_tail_call(...);
>     ... when forall
>     return DROP_MISSED_TAIL_CALL;
>   |
>     ep_tail_call@p1(...);
>   )
>
>   @rule2@
>   position p2, rule1.p1;
>   identifier fn != send_drop_notify;
>   @@
>
>   fn(...) {
>   <+...
>   ep_tail_call@p1@p2(...);
>   ...+>
>   }
>
> When I tried using rule1 as the body of the function in rule2, it just
> didn't match anything anymore.
>
> Thanks,
> Paul
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
