Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2793F1952B3
	for <lists+cocci@lfdr.de>; Fri, 27 Mar 2020 09:22:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02R8MNOL023378;
	Fri, 27 Mar 2020 09:22:23 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 351AE781E;
	Fri, 27 Mar 2020 09:22:23 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 54F4E3B63
 for <cocci@systeme.lip6.fr>; Fri, 27 Mar 2020 09:22:21 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02R8MKcc009963
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Fri, 27 Mar 2020 09:22:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1585297322;
 bh=09xSHgI4+pz/lOuIHHd1hLw07vgXad9er5cWcbQjT2I=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=piqSM48RXiUJqrKsyM7bpYPWpWE3NpdVwQ21B5NZBWqVk2FMkm9dkO8DGryKPEFoi
 sBOaOwJkcbnNfRybSl7Mp6VeSKd3/KQWGbUgbodcsdHmHCsJcrgrlz70weFtS8GQmG
 CzgXKNUji5x9l5Msw23LnAZ0caTAgG6tQhvgVTrk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.164.253]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LyOuM-1jLT3f3qLe-015n27; Fri, 27
 Mar 2020 09:22:02 +0100
To: Michel Lespinasse <walken@google.com>, Coccinelle <cocci@systeme.lip6.fr>,
        linux-mm@kvack.org
References: <20200327021058.221911-1-walken@google.com>
 <20200327021058.221911-6-walken@google.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <554c16c7-cfad-2d36-d7ae-4c17190a2b50@web.de>
Date: Fri, 27 Mar 2020 09:21:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327021058.221911-6-walken@google.com>
Content-Language: en-US
X-Provags-ID: V03:K1:/uC6/hsQfP2gaWqRYwVagI8UGJqU9uA4QIurdD3KAJZirSReeLy
 iC+P3aIO7TjMfWknEcfxrtEWfAMe4q+dBNr/2lkJ4z0mDbOoznCFm6CiqXuIiF28vZ31csD
 +CFyEecW4/M/2xUjmqEOhNHzBKEP4/wIi7pYoVrq71IAEY4NjSMwrtaVfyO6DtiiEwvsMyS
 aI4DST4ofnTt3Ne0fgZ3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P5oad6+qnTU=:Y0cdRzR5dzNPMgYQb4iijO
 bnwi38gC4qyuYE1LljmdgpmGZODCla5jTmfm1cRDjed8dPkc++AO1k+wbz4YqHQYLRwL/qnJm
 0Wrutu4U7wU7wiw7UjQZB73qVm+fBU9M0pI1TkMwhNLqk0ZoiqVgDDOj3vXNNLqEJb979j/8c
 ++G1EWeYs9HxE3/76wzzrnusR+1wSn3xWgBh22hgc7zlb2APIJy+XBP4Hp76XU610i9xqM53F
 6Hz0xdG5aojmZ3Al8ZqgIAPQYqrSkjmqrhhn3TYVADu4LOrPDzxNfb8BHNJyLR+P9fyIWI91x
 ktcw/vpSZ1rHswuFMTeupOwUu2lMIvKMiX1vtj/muts6TH6OR30bx0JTIazmDMZElfC8Hpssj
 w5dWGwqzVhS7M5MWx5qia/SafWRSjEyTmMyttcLawS3JxHGs2yWxwlaonLotba8JVlCqbKy+6
 jDpcxyScd3h0mXV0Hu6k6rpervKVF/a7yU1pUYLWNZbzSBivCdxi1xTnhEyyVUCrCTDYqUvfb
 G41XM9Q9xIZIBDXQZ92dzN/6H7vD45laxRiY5/9KNnNZIzLEXbgEwHyMvWWN+FQRf4J0U+waT
 tD1KUuroZoEsMDSgvSGNpzyPn0BIkvYc0g12JGtyFY3KEuQlbuXWnAC9gYqzo5aZR8kJHRywO
 lGyq/yqymeZ6V4Tf+Mp4Z7a7ueJuX/DOpJE/SVfOoo3va0EtOjSb6tjUkioVKViU+aeA/3vEd
 o4K0HRfegdtYGJgOFPEv+yr70Mmpk9T/FNbPA6YT5HM0k9fBfusHi8xWdU/y/WSPEjPGfUhsD
 /rqvio285+gc0gWWfhnqAkhiugri71rDwp/UFHET4B4lAXNOGqpyoERBO4D6qM2Nd+Khuf7wg
 Vdi4NDLd4tDPBcxtW9UC1u75TJEuwMt1isgzy0AeUfVYHOc7z65UiVggJ3nhmYB+ULri9KQtR
 HulKnQ9SEhohlFAFbdLnfrzwFCY4aXaMcwYKJtDffOtiry10yxqj5FHQ8C1tZI+W6VHb23/C0
 oMe/iIcZq3uXs5V3BL2HAwTmrPkzqUX9ToL9AzGci1IcYwtXO8GQphMDdxXkv2QZOwxfq3/YO
 jIXPabuDj+wf3rv31TEG/UKwKQVYKuCbWvNIWon3RXlu4vRazq0xxBiIdTCx4XhUY4Cl3UTgl
 f4t9Q1m3rG6gNwX831HBNHco6dG1v6cKkrQmwa1jj2kj2EwHEj5D/8bzlyvU3UTS0wZa+/+Uo
 TR+rZy/6ruqr8oqcd
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 27 Mar 2020 09:22:23 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 27 Mar 2020 09:22:20 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Davidlohr Bueso <dave@stgolabs.net>, Peter Zijlstra <peterz@infradead.org>,
        Hugh Dickins <hughd@google.com>, LKML <linux-kernel@vger.kernel.org>,
        Liam Howlett <Liam.Howlett@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Matthew Wilcox <willy@infradead.org>, Ying Han <yinghan@google.com>,
        David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [Cocci] [PATCH v2 05/10] mmap locking API: convert mmap_sem
 call sites missed by coccinelle
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

> Convert the last few remaining mmap_sem rwsem calls to use the new
> mmap locking API. These were missed by coccinelle for some reason

I find such a software situation still unfortunate.

* Should the data processing results be clarified any further
  for the shown transformation approach?

* Will additional improvements be considered?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
