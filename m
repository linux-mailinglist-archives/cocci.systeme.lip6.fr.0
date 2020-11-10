Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1F2ADA02
	for <lists+cocci@lfdr.de>; Tue, 10 Nov 2020 16:15:49 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AAFFI07003043;
	Tue, 10 Nov 2020 16:15:18 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 697D9779B;
	Tue, 10 Nov 2020 16:15:18 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2B6BE454B
 for <cocci@systeme.lip6.fr>; Tue, 10 Nov 2020 16:15:16 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AAFFFTC023152
 for <cocci@systeme.lip6.fr>; Tue, 10 Nov 2020 16:15:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605021315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MyjxrWBjAFPJgRONhoOP3ongLOspKpkozxNzFNHHQNs=;
 b=KLyBe3NRT7py7OZA8Xd2psT7NFjrYvuoqKTdqaLl3+pnuIEKz7tSIm3WVq3R1XSppz005r
 5n/FYK84gATP2FBoPgcdHyI74k0vTi8WQBiJ3A/6Qpz3rnaf0e2O0SGRyp2fImM3dWX995
 gTb/9r6kXtDbiuBCqjT6/bzlNT6L3X8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-jtWsDzHiOi-m7g5EXFweBw-1; Tue, 10 Nov 2020 10:15:10 -0500
X-MC-Unique: jtWsDzHiOi-m7g5EXFweBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 227E910866B3;
 Tue, 10 Nov 2020 15:15:09 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C16B95B4CF;
 Tue, 10 Nov 2020 15:15:08 +0000 (UTC)
Date: Tue, 10 Nov 2020 15:15:07 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: julia.lawall@inria.fr
Message-ID: <20201110151507.GA25508@redhat.com>
References: <20201110151058.82289-1-rjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201110151058.82289-1-rjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 10 Nov 2020 16:15:18 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 10 Nov 2020 16:15:15 +0100 (CET)
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH Python 10] bundles/pyml: Remove bindings for
 PyObject_As(Char|Read|Write)Buffer
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

On Tue, Nov 10, 2020 at 03:10:57PM +0000, Richard W.M. Jones wrote:
> Some more functions were deprecated/removed in Python 10,
> breaking Coccinelle compiles.  It was reported by Fedora's
> Python team here:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1896393
> 
> I have fixed it by chopping out bindings for these
> functions from the bundled pyml, and it compiles fine
> for me with Python 10 now.

Erm, Python 3.10, not Python 10 obviously :-)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
